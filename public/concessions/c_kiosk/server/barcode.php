<?php
   require "phpQuery.php";
   require "db/db.php";
   require "db/item.php";
   #require "db/user.php";

   $barcode = $_REQUEST['barcode'];
   #$user = user::getUserByBarcode($barcode);
   $item = item::getItemByBarcode($barcode);
   
   echo json_encode(array(
      'name'  =>  is_null($item) 
                     ? "Unknown" 
                     : $item->getName(),
      'price' =>  is_null($item) 
                     ? "Ask Officer" 
                     : $item->getPrice()
   ));
?>
