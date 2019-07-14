// $(function(){

//   function receive(event, element){
//     var data = event.dataTransfer.items;
//     var image = new image;
//     image.src = createObjectURL(data, getAsFile());

//     document.getElementsByClassName("sell-content__upload-box--form").value = image;
//   }

//   $('.sell-content__upload-box--form').change(function(){
//     // if ( !this.files.length ) {
//     //   return;
//     // }
//     // $('.sell-content__upload-box').text('');

//     var $files = $(this).prop('files');
//     var len = $files.length;
//     for ( var i = 0; i < len; i++ ) {
//       var file = $files[i];
//       var fr = new FileReader();

//       fr.onload = function(e) {
//         var src = e.target.result;
//         var img = '<div class="preview-image">' +
//                     '<img src="'+ src +'">' +
//                     '<div class="btn-zone">' +
//                       '<a class="remove-btn" id="remove-image[' + i +']">削除</a>' +
//                     '</div>' +
//                   '</div>';
//         $('.sell-content__upload-box').prepend(img);
//       }

//       fr.readAsDataURL(file);
//     }

//     $('remove-btn').on('click', function(){
//       // $filesの中身をハッシュの番号を指定して削除するメソッド
//     })

//     $('.sell-content__upload-box').css('display','block');
//   });

//   window.ondrop = function(e){
//     e.preventDafault();
//   };

// });

// $(function(){
//   $('#file-btn').on('click', function(){
//     $('.sell-content__upload-box--form').trigger('click');
//   });
// })


$(function(){

  var upload_box = $('.sell-content__upload-box')

  function prependAddImagesHTML (image){
    var img = '<div class="preview-image">' +
                '<img src="'+ image.image.url +'">' +
                '<div class="btn-zone">' +
                  '<a class="remove-btn" id="remove-image[' + image.id +']">削除</a>' +
                '</div>' +
                '<input type="hidden" value-"'+ image.url +'">' +
              '</div>';

    upload_box.prepend(img);
  }

  function appendErrMsgToHTML(msg) {
    var html =  '<div>' +
                  '<p">${ msg }</p>' +
                '</div>'

    upload_box.append(html);
  };

  $('.sell-content__upload-box--form').on('change', function(){

    var formdata = FormData.new
    $(".sell-content__upload-box--form").val();

    $.ajax({
      type: 'GET',
      url: '/items/new',
      data: { keyword: input },
      dataType: 'json'
    })
    .done(function(images){
      $(".sell-content__upload-box").empty();
      if (images.length !== 0){
        images.forEach(function(image){
          prependAddImagesHTML(image);
        });
      }
      else {
        appendErrMsgToHTML("imageが入力されていません");
      };
    })
    .fail(function(){
      alert('通信に失敗しました');
    })
  })
})