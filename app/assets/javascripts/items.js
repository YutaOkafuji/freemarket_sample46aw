$(function() {

  var image_count = $('.item-detail-content__photo--small li').length

  if (image_count >= 5) {
    $('.item-detail-content__photo--small img').css({'height': '60px', 'width': '60px'});
  }

  $('.slider').slick({
    arrows:false,
    asNavFor:'.thumb',
  });
  $('.thumb').slick({
    asNavFor:'.slider',
    focusOnSelect: true,
    // スライダーの画像の表示数を5に設定。余裕があればナビゲーション画像が6枚以上の場合に2段で表示できるよう実装する。
    slidesToShow:5
  }); 

  $('.thumb li').on('mouseover', function(e) {
    $( this ).click();
  })

  $('.small-photo').on('mouseover', function() {
    var dataSrc = $(this).attr('src');
    $('.big-photo').attr('src',dataSrc);
    $('img').removeClass('active');
    $(this).addClass('active');
  });
});