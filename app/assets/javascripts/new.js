$(function() {
  function isInteger(number) {
    return String(Math.round(number)) === String(number);
  }

  $('.input-form').keyup(function(){
    var input = $(this).val();
    var fee = parseInt(input / 10);
    var profit = input - fee;
    fee = fee.toString().replace(/(\d)(?=(\d{3})+$)/g , '$1,');
    profit = profit.toString().replace(/(\d)(?=(\d{3})+$)/g , '$1,');
    if (input >= 300 && input <= 9999999 && isInteger(input)) {
      $('.price-form__right-side').text("¥" + fee);
      $('.price-form__right-side.bold').text("¥" + profit);
    } else {
      $('.price-form__right-side').text("-");
      $('.price-form__right-side.bold').text("-");
    }
  });
});
