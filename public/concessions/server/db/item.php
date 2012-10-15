<?php
   require("db.php");
   
   class item {
      public function item($barcode, $name, $price, $stock, $date_introduced = NULL) {
         $this->barcode = $barcode;
         $this->name = $name;
         $this->price = $price;
         $this->stock = $stock;
         $this->date_introduced = $date_introduced;
      }

      public function getBarcode() {
         return $this->barcode;
      }

      public function getName() {
         return $this->name;
      }

      public function getPrice() {
         return $this->price;
      }

      public function getStock() {
         return $this->stock;
      }
      
      public function getDateIntroduced() {
         return $this->date_introduced;
      }

      /*public function sync() {
         if (is_null(item::getItemByBarcode($this->barcode))) {
            if (is_null($this->date_introduced)) {
               $this->date_introduced = date("Y-m-d");
            }

            mysql_query("INSERT INTO " . INVENTORY_TABLE . "
               (barcode, name, price, stock, date_introduced) VALUES(
               '{$this->barcode}', '{$this->name}', '{$this->price}', '{$this->stock}', 
               '{$this->date_introduced}')");
            
            if (mysql_error()) {
               echo mysql_error();
               return false;
            }

            return true;
         }
      }*/
      
      public static function getItemByBarcode($barcode) {
         $result = mysql_query("SELECT * FROM " . INVENTORY_TABLE . "
            WHERE barcode='{$barcode}'");
         if (mysql_error()) {
            print mysql_error();
            return NULL;
         }

         $item_obj = NULL;
         if ($item = mysql_fetch_array($result)) {
            $item_obj = new Item($item['barcode'], $item['name'],
               $item['price'], $item['stock'], $item['date_introduced']);
         }
         
         return $item_obj;
      }
   }
?>
