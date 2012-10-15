<?php
   require("weather_com.php");
   class weather {
      const CACHE  = "cache";
      const RENEW  = 25.0;    //Minutes

      public function weather($zipcode) {
         $this->zipcode = $zipcode;
         $this->sync();
      }

      private function sync() {
         $now = time();
         $cached_copy_path = sprintf(
            '%s/%s.xml', self::CACHE, $this->zipcode);
         $weather_xml = null;

         if (file_exists($cached_copy_path)) {
            $diff = $now - filemtime($cached_copy_path);
            echo $diff;
            if (($diff / 60.0) > self::RENEW) {
               echo "copy out of date " . $cached_copy_path;
               $weather_xml = $this->updateCache($cached_copy_path);
            } else {
               echo "copy up to date " . $cached_copy_path;
               $cache_file = fopen($cached_copy_path, 'r') 
                  or die("can't open cache file");
               $weather_xml = fread($cache_file, filesize($cached_copy_path));
            }
         } else {
            echo "creating new " . $cached_copy_path;
            $weather_xml = $this->updateCache($cached_copy_path);
         }
      }

      private function updateCache($cache_path) {
         $weather_xml = weather_com::update($this->zipcode);
         $cache_file = fopen($cachePath, 'w');

         fwrite($cache_file, $weather_xml);
         fclose($cache_file);

         return $weather_xml;
      }
   }

   $w = new weather("94720");
?>
