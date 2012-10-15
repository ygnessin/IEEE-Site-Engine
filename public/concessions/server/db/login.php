<?php
   define('DB_SERVER', 'localhost');
   define('DB_USERNAME', 'root');
   define('DB_PASSWORD', 'geheim');
   
   mysql_connect(DB_SERVER, DB_USERNAME, DB_PASSWORD) 
      or die(mysql_error());
?>
