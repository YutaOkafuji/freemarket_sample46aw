$(window).on('load',function(){
    if(location.href.match(/user_addresses/)) {
      $('#progress-auth').removeClass('progress-auth');
      $('#progress-auth').addClass('active-after');
      $('#progress-address').removeClass('progress-address');
      $('#progress-address').addClass('active-before');
    }else if (location.href.match(/credits/)){
      $('#progress-auth').removeClass('progress-auth');
      $('#progress-auth').addClass('active-after');
      $('#progress-address').removeClass('progress-address');
      $('#progress-address').addClass('active-all');
      $('#progress-credit').removeClass('progress-credit');
      $('#progress-credit').addClass('active-before');
    }else if (location.href.match(/create/)){
      $('#progress-auth').removeClass('progress-auth');
      $('#progress-auth').addClass('active-after');
      $('#progress-address').removeClass('progress-address');
      $('#progress-address').addClass('active-all');
      $('#progress-credit').removeClass('progress-credit');
      $('#progress-credit').addClass('active-all');
      $('#progress-end').removeClass('progress-end');
      $('#progress-end').addClass('active-end');
    }
  });