<?php
   require("db.php");
   
   class user {
      public function user($sid, $name, $credit) {
         $this->sid = $sid;
         $this->name = $name;
         $this->credit = $credit;
      }

      public function getSid() {
         return $this->sid;
      }

      public function getName() {
         return $this->name;
      }

      public function getCredit() {
         return $this->credit;
      }

      public function deduct($amount) {
         $this->credit -= $amount;
      }

      public function sync() {
         mysql_query("UPDATE " . USER_TABLE . "set credit=" . $this->tab .
            " where sid=" . $this->sid)
      }
      
      public static function getUserBySid($sid) {
         $result = mysql_query("SELECT * FROM " . USER_TABLE . "
            WHERE sid='{$sid}'");
         if (mysql_error()) {
            print mysql_error();
            return NULL;
         }

         $user_obj = NULL;
         if ($user = mysql_fetch_array($result)) {
            $user_obj = new Item($user['sid'], $user['name'],
               $user['credit']);
         }
         
         return $user_obj;
      }
   }
?>
