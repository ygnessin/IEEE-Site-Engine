<?php
   require("login.php");
   
   define('DB_NAME', 'concessions');
   define('INVENTORY_TABLE', 'inventory');
   define('TRANSACTIONS_TABLE', 'transactions');
   define('USER_TABLE', 'users');
   
   mysql_select_db(DB_NAME) or die(mysql_error());
?>
