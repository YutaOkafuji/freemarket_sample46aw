let form = $('#card');
  Payjp.setPublicKey('pk_test_e4856fd905ac999e97305b99');
  $('#submit_btn').on('click',function(e){
    e.preventDefault();

    var card = {
      number: $('#card_number').val(),
      cvc: $('#card_cvc').val(),
      exp_month: $('#card_month').val(),
      exp_year: $('#card_year').val()
    };
    Payjp.createToken(card,function(status,response){
      form.find('input[type=submit]').prop('disabled', true);
      if(status = 200){
        $('#card_number').removeAttr('name');
        $('#card_cvc').removeAttr('name');
        $('#card_month').removeAttr('name');
        $('#car_year').removeAttr('name');
        let payjphtml = `<input type='hidden name='payjpToken' value=${response.id}>`
        form.append(payjphtml);
        document.inputForm.submit();
      }else{
        alert('カード情報が正しくありません');
      }
    });
  });
