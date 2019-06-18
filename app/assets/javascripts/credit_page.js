$(document).on('turbolinks:load',function() {

  $('#credit-input').formatter({
    'pattern': '{{9999}}-{{9999}}-{{9999}}-{{9999}}'
  });
  
  $('#credit-input').onlyPhoneNumber();

  $('#show-tips-toggle').click(function(){
    $('.about-seqcode__info').fadeToggle(300);
  });
});
