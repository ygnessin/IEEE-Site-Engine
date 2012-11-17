$(document).ready(function() {
  $('#amount').blur(function() {
    var amount = $(this).val();
    var money = amount.match(/^\$?(\d*)\.?(\d{0,2}).*/);
    var dollars = money[1];
    var cents = money[2];

    // Check the result of the parsing and format accordingly
    if (dollars == '') {
      dollars = '0';
    }
    if (cents == '') {
      cents = '00';
    }
    if (cents.length == 1) {
      cents += "0";
    }

    amount = String((parseInt(dollars) * 100) + parseInt(cents));
    $('.stripe-button').attr('data-amount', amount);

    // If the stripe button already has the attribute, changing it won't do
    // anything, so remove the button and reinsert it.
    /*
    if ($('.stripe-button').attr('data-amount')) {
      $('.stripe-button').remove();
      $('.stripe').add('<script src="https://button.stripe.com/v1/button.js" class="stripe-button" data-key="pk_zoy1u3xaiebEhp2jLt7BNRZ2HtRuc" data-amount="' + amount + '" data-label="Donate"></script>');
    } else {
      $('.stripe-button').attr('data-amount', amount);
    }
    */
  });

});
