<?php
   require("db/db.php");
   
   function writeTransaction($timestamp, $barcode, $count) {
      mysql_query("INSERT INTO " . TRANSACTIONS_TABLE . "
         (transaction_time, barcode, quantity) VALUES(
         '{$timestamp}', '{$barcode}', '{$count}')");
      
      if (mysql_error()) {
         echo mysql_error();
         return false;
      }
      return true;
   }
      
   $timestamp = date("Y-m-d H:m:s");
   foreach($_REQUEST['purchase_hash'] as $barcode => $count) {
      writeTransaction($timestamp, $barcode, $count);
   }
?>
