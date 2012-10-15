<?php
   class weather_com {
      const PARTNER_ID  = '1209009978';
      const PARTNER_KEY = '6656f8ed78d27738';
      const WEATHER_URL = 'http://xoap.weather.com/weather/local/%s?cc=*&par=%s&key=%s';

      public static function update($zipcode) {
         $url = sprintf(weather_com::WEATHER_URL, 
                        $zipcode, 
                        weather_com::PARTNER_ID, 
                        weather_com::PARTNER_KEY);

         $xml = file_get_contents($url);
         return $xml;
      }
   }
?>
