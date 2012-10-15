<?php
    require_once("weather/pxweather.php");
    $w = new Weather();
    $w->load();
    echo $w->getCurrent("temp.string");
?>
