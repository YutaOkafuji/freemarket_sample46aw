$(function(){
  function receive(event, element){
    var data = event.dataTransfer.items;
    var image = new image;
    image.src = createObjectURL(data, getAsFile());

    document.getElementsByClassName("sell-content__upload-box--form").value = image;
  }

  $('.sell-content__upload-box--form').change(function(){
    // if ( !this.files.length ) {
    //   return;
    // }
    // $('.sell-content__upload-box').text('');

    var $files = $(this).prop('files');
    var len = $files.length;
    for ( var i = 0; i < len; i++ ) {
      var file = $files[i];
      var fr = new FileReader();

      fr.onload = function(e) {
        var src = e.target.result;
        var img = '<div class="preview-image">' +
                    '<img src="'+ src +'">' +
                    '<div class="btn-zone">' +
                      '<a class="remove-btn" id="remove-image[' + i +']">削除</a>' +
                    '</div>' +
                  '</div>';
        $('.sell-content__upload-box').prepend(img);
      }

      fr.readAsDataURL(file);
    }

    $('remove-btn').on('click', function(){
      // $filesの中身をハッシュの番号を指定して削除するメソッド
    })

    $('.sell-content__upload-box').css('display','block');
  });

  window.ondrop = function(e){
    e.preventDafault();
  };

  window.addEventListener("beforeunload", function(e){
    var confirmationMessages = "ooo";
    e.returnValue = confirmationMessages;

    return confirmationMessages;
  })
});


