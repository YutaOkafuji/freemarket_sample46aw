$(document).on('turbolinks:load',function() {

  $('#credit-input').formatter({
    'pattern': '{{9999}}-{{9999}}-{{9999}}-{{9999}}'
  });
});
