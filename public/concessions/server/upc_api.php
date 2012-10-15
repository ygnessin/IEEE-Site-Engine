<?php
   require("phpQuery.php");

   $barcode = $_REQUEST['barcode'];
   $doc = phpQuery::newDocumentFileHTML(
      "http://www.upcdatabase.com/item/" . $barcode );

   $product_description = 
      $doc['table.data > tr']->children(
         'td:first:contains("description")')->siblings(
            ':last')->text();

   echo json_encode(array(
      'name' => ($product_description == "") 
         ? "Unknown" 
         : $product_description
   ));
?>
