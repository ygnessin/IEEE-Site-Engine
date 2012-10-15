<?php

/*
 *	pxWeather - PHP/XML Weather Retrieval
 *	by Jonathan Abbett
 *	jonathan[at]abbett[dot]org
 *
 *
 *
 */

require_once("xmlize-php5.inc.php");

/*
** Constants
*/
define("PXWEATHER_URL",		0);		// to set $_url
define("PXWEATHER_CACHE",	1);		// to set $_cache
define("PXWEATHER_CACHEFOR",	2);		// to set $_age
define("PXWEATHER_CACHEAT",	3);		// to set $_cachepath

class Weather {


	// The URL from whence to retreive XML weather data
	var $_url	= "http://www.weather.unisys.com/forexml.cgi";
	// If true, will use a local file cache
	var $_cache	= false;
	// How many minutes to keep the cached data
	var $_age	= 60;
	// If cache-enabled, use this directory for storing data
	var $_cachepath	= "cache";




	var $_xml	= null;		// to store our xml array
	var $_city	= "berkeley";	// The city we're interested in
	var $_force	= false;	// If true, will override the cache and fetch data fresh


	/*
	** Constructor
	*/
	function Weather($city = "Boston", $force = false) {

		$this->_city = strtoupper($city);
		$this->_force = $force;

	}

	function setOption($option, $value) {

		switch($option) {
			case EASYWEATHER_URL:
				$this->_url = $value;
				break;
			case EASYWEATHER_CACHE:
				$this->_cache = $value;
				break;
			case EASYWEATHER_CACHEFOR:
				$this->_age = $value;
				break;
			case EASYWEATHER_CACHEAT:
				$this->_cachepath = $value;
				break;
		}

	}

	/*
	** Return a pretty-printed version of the XML array
	*/
	function toString($array = null) {

		 if ($array == null) {
			$array = $this->_xml;
		 }

		 echo "<pre>";
		 print_r($array);
		 echo "</pre>";
	}

	/*
	** Return a specific field from the current weather report
	*/
	function getCurrent($field) {
		$o = $this->_getObservation();

		if (array_key_exists($field, $o)) {
			return $o[$field];
		}
		else {
			return null;
		}
	}

	function getSunrise() {
		$a = $this->_getAlmanac();

		return $a["sunrise"];
	}

	function getSunset() {
		$a = $this->_getAlmanac();

		return $a["sunset"];
	}

	function getForecasts() {

		// need to remove a layer of separation

		$forecasts = $this->_xml["forexml"]["#"]["forecast"];

		$returnArray = array();

		$i = 0;

		foreach ($forecasts as $forecast) {
			$returnArray[$i] = $forecast["@"];
			$i++;
		}

		return $returnArray;

	}

	function getDaycasts() {

		// need to remove a layer of separation

		$daycasts = $this->_xml["forexml"]["#"]["daycast"];

		$returnArray = array();

		$i = 0;

		foreach ($daycasts as $daycast) {
			$returnArray[$i] = $daycast["@"];
			$i++;
		}

		return $returnArray;
	}

	/*
	** Returns a weather condition string given a code (i.e 'TS')
	*/
	function weatherString($code) {

		switch($code) {
			case "TS":
				return "Thunderstorms";
				break;
			case "RA":
				return "Rain";
				break;
			case "MC":
				return "Mostly cloudy";
				break;
			case "SU":
				return "Sunny";
				break;
			case "MO":
				return "Mostly clear";
				break;
			case "PC":
				return "Partly cloudy";
				break;
			case "SN":
				return "Snow";
				break;
			case "CL":
				return "Overcast";
				break;
			case "FG":
				return "Fog";
				break;
		}

		return null;

	}

	function load() {

		$filename = "$this->_cachepath/weather.$this->_city.cache";

		// if not force, check cache for valid file
		if (!$this->_force && $this->_cache) {

			if (file_exists($filename)
					&& filemtime($filename) > (time() - ($this->_age * 60))) {

				$file = fopen($filename, "r");
				$this->_xml = unserialize(fread($file, filesize($filename)));
				fclose($file);

				return;
			}
		}

		// if force, or no valid cache file, get XML fresh

		$this->_xml = $this->_getXML();

		if ($this->_cache) {
			$file = fopen($filename, "w");
			fwrite($file, serialize($this->_xml));
			fclose($file);
		}

	}

	function _getXML() {

		$ch = curl_init();
		curl_setopt($ch, CURLOPT_URL,				$this->_url . "?" . $this->_city);
		curl_setopt($ch, CURLOPT_HEADER,			false);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 	true);

		$xml = curl_exec($ch);

		if (curl_errno($ch)) {
			trigger_error("cURL Error in Weather._getXML: " . curl_error($ch), E_WARNING);
			return null;
		}

		curl_close($ch);

		return xmlize($xml);

	}

	function _getObservation() {

		return $this->_xml["forexml"]["#"]["observation"][0]["@"];

	}

	// array with keys "sunrise" and "sunset"
	function _getAlmanac() {

		return $this->_xml["forexml"]["#"]["almanac"][0]["@"];
	}

}
	
?>
