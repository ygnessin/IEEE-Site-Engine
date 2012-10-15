<?php
   require_once("weather/pxweather.php");

   #$w = new Weather();
   #$w->load();
   #$temperature = $w->getCurrent("temp.string");
   #$pattern = "/(\d+).*\(\d+.*\)/";

   #preg_match($pattern, $temperature, $matches);
   #$temperature = $matches[1];

   #echo $temperature . "\n";
   foreach($_REQUEST['purchase_hash'] as $barcode => $count) {
      echo $barcode . " " . $count;
   }
?>
