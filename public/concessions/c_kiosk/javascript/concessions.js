$(document).ready(function() {
   var order_total = 0;
   var dirty       = null;
   var timeout     = 30000;
   
   $('table#item_list > tfoot').hide();
   $('input#barcode_input').focus();
   $('input#barcode_input').blur(function() {
      $(this).focus();
   });

   $('input#barcode_input').change(function() {
      var barcode = $(this).val();
      clearTimeout(dirty);
      dirty = setTimeout(reset, timeout);

      switch(barcode.toUpperCase()) {
         case 'FINISH' : finish(); break;
         case 'RESET'  : reset(); break;
         case 'RELOAD' : location.reload(true); break;
         default : fetchItem($(this), barcode); break;
      }

      clearField($(this));
   });

   function finish() {
      var purchase_hash = {};
      $('table#item_list > tbody > tr').each(
         function(index, item) {
            var barcode = $(item).attr('barcode');
            if (purchase_hash[barcode] == undefined) 
               purchase_hash[barcode] = 0;
            purchase_hash[barcode] += 1;
         }
      );

      $.post('server/transactions.php', {'purchase_hash': purchase_hash},
         function(resp) {
            console.log(resp);
         }
      );

      flash("Thx! Please pay :)");
      reset();
   }

   function reset() {
      $('table#item_list > tbody').empty();
      $('table#item_list > tfoot').hide();

      clearTimeout(dirty);
      order_total = 0;
   }

   function flash(message) {
      $('input#barcode_input').val(message);
      clearField($('input#barcode_input'), 1500);
   }

   function fetchItem(field, barcode) {
      $.post('server/barcode.php', {'barcode': barcode},
         function(data) {
            data = $.parseJSON(data);
            var raw_price = parseFloat(data['price']);
            if (!isNaN(raw_price))
               order_total += raw_price;

            var item_row = $('<tr />').attr('barcode', barcode);
            var item_description = $('<td />').html(data['name']);
            var item_price = $('<td />').html('$ ' + raw_price.toFixed(2));
            
            item_row.append(item_description);
            item_row.append(item_price);
            item_row.appendTo($('table#item_list > tbody'));

            if ($('table#item_list > tfoot').is(':hidden')) {
               $('table#item_list > tfoot').show();
            }
            
            $('td#total').html('$ ' + order_total.toFixed(2));
         }
      );
   }

   function clearField(field, timeout) {
      if (timeout == undefined) timeout = 400;
      field.animate({color: '#FFFFFF'}, timeout,
         function() {
            field.val("");
            field.css("color", "#000000");
         }
      );

      field.focus();
   }
});
