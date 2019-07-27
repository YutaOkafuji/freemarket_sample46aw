// $(function(){

//   $('.sell-content__upload-box p').click(function(){
//     $('.sell-content__upload-box--form').trigger('click');
//   })
//   $('.sell-content__upload-box2 p').click(function(){
//     $('.sell-content__upload-box--form').trigger('click');
//   })
// })

$(function(){

  // 新規追加画像を格納する配列（ビュー用）
  var images = [];
  // 新規追加画像を格納する配列（DB用）
  var new_image_files = [];

  var num = images.length;

  switch(num){
    case 0:
      selectImageForm = $('.sell-content__upload-box--form').eq(0);
      break;
    case 1:
      selectImageForm = $('.sell-content__upload-box--form').eq(1);
      break;
    case 2:
      selectImageForm = $('.sell-content__upload-box--form').eq(2);
      break;
    case 3:
      selectImageForm = $('.sell-content__upload-box--form').eq(3);
      break;
    case 4:
      selectImageForm = $('.sell-content__upload-box--form').eq(4);
      break;
    case 5:
      selectImageForm = $('.sell-content__upload-box--form').eq(5);
      break;
    case 6:
      selectImageForm = $('.sell-content__upload-box--form').eq(6);
      break;
    case 7:
      selectImageForm = $('.sell-content__upload-box--form').eq(7);
      break;
    case 8:
      selectImageForm = $('.sell-content__upload-box--form').eq(8);
      break;
    case 9:
      selectImageForm = $('.sell-content__upload-box--form').eq(9);
      break;
  }


  new_input_num = 10
  function inputImage(new_input_num){
    var html = '<input class="sell-content__upload-box--form"' +
                'type="file" name="item[item_images_attributes][' + new_input_num +
                '][photo]" id="item_item_images_attributes_' + new_input_num + '_photo">';
  $('.sell-content__upload-box--input').append(html);
  }

  $('.sell-content__upload-box p, .sell-content__upload-box2 p').click(function(){
    selectImageForm.trigger('click');
  })
  selectImageForm.on('change', function(){
    createPreview();
  })


  function createPreview (){
    var file = selectImageForm.prop("files")[0];
    var reader = new FileReader();

    var img = $(`<li class="preview-image" style="margin: 0 0 10px 10px;">
                  <img>
                  <div class="btn-zone">
                    <a class="remove-btn" data-id="">削除</a>
                  </div> 
                </li>`);

    reader.onload = function(e) {
      img.find("img").attr({
        src: e.target.result
      });
    };

    reader.readAsDataURL(file);
    images.push(img);

    // 画像が４枚以下のとき
    if (images.length <= 4) {
      $('.sell-content__upload-box--preview ul').empty();
      $.each(images, function(index, image) {
        image.data('image', index);
        $('.sell-content__upload-box--preview ul').append(image);
      })

      // 画像が５枚のとき１段目の枠を消し、２段目の枠を出す
    } else if (images.length == 5) {
      $(".sell-content__upload-box--preview ul").empty();
      $.each(images, function(index, image) {
        image.data("image", index);
        $('.sell-content__upload-box--preview ul').append(image);
      });
      $('.sell-content__upload-box--click').css({display: "none"});
      $('.sell-content__upload-box2--click2').css({display: "block"});
      
      $('.sell-content__upload-box2--preview2 ul').empty();

      // 画像が６枚以上のとき
    } else if (images.length >= 6) {
      // 配列から６枚目以降の画像を抽出
      var pickup_images = images.slice(5);

      $.each(pickup_images, function(index, image) {
        image.data("image", index + 5);
        $('.sell-content__upload-box2--preview2 ul').append(image);
      });

      // 画像が１０枚になったら枠を消す
      if (images.length == 10) {
        $('.sell-content__upload-box2--click2').css({display: "none"});
      }
    }
  }
  //   var new_image = $(
  //     `<input multiple= "multiple" name="item_images[image][]" class="upload-image" data-image= ${images.length} type="file" id="upload-image">`
  //   );
  //   input_area.append(new_image);
  // });

  // 削除ボタンを押した時
  $(document).on('click', '.remove-btn', function(){

    // 削除ボタンを押した画像を取得
    var target_image = $(this).parent().parent();

    // 削除画像のdata-image番号を取得
    var target_image_num = target_image.data('image');

    // 対象の画像を削除
    target_image.remove();

    // 対象の画像を削除した新たな配列を生成
    images.splice(target_image_num, 1);

    // 新たなinputの作成
    inputImage(new_input_num);
    new_input_num += 1;

    // 削除後の配列の中身の数で条件分岐
    // 画像が４枚以下のとき
    if (images.length <= 4) {
      $('.sell-content__upload-box--preview ul').empty();
      $.each(images, function(index, image) {
        image.data('image', index);
        $('.sell-content__upload-box--preview ul').append(image);
        $('.sell-content__upload-box--click').css({display: "block"});
        $('.sell-content__upload-box2--click2').css({display: "none"});
      })

      // 画像が５枚のとき１段目の枠を消し、２段目の枠を出す
    } else if (images.length == 5) {
      $(".sell-content__upload-box--preview ul").empty();
      $.each(images, function(index, image) {
        image.data("image", index);
        $('.sell-content__upload-box--preview ul').append(image);
      });
      $('.sell-content__upload-box--click').css({display: "none"});
      $('.sell-content__upload-box2--click2').css({display: "block"});
      $('.sell-content__upload-box2--preview2 ul').empty();


      // 画像が６枚以上のとき
    } else {
      // １〜５枚目の画像を抽出
      var pickup_images1 = images.slice(0, 5);

      // １〜５枚目を１段目に表示
      $(".sell-content__upload-box--preview ul").empty();
      $.each(pickup_images1, function(index, image) {
        image.data('image', index);
        $('.sell-content__upload-box--preview ul').append(image);
      })

      // ６枚目以降の画像を抽出
      var pickup_images2 = images.slice(5);

      // ６枚目以降を２段目に表示
      $.each(pickup_images, function(index, image) {
        image.data("image", index + 5);
        $('.sell-content__upload-box2--preview2 ul').append(image);
      });
    }
  })
})
