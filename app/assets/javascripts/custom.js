
$(document).on('turbolinks:load', function() {
  $('#entry_count').change(function() {
  
    var price = $('#event_price').val();
    var count = $('#entry_count').val();
  
    var price_i = parseInt(price);
    var count_i = parseInt(count);
  
    var result = price_i * count_i
  
    $('#entry_price').val(result)
  });
});
