$(function(){
  
  $('.rollover').each(function(){

    // jQueryオブジェクトを用意
    var a = $(this);
    var img = a.find('img');

    // 通常時・マウスオーバー時のsrc属性を用意
    var src_off = img.attr('src');
    var src_on = src_off.replace('_off','_on');

    // 画像をプリロード
    $('<img />').attr('src', src_on);

    // イベントを設定
    a.bind('mouseenter focus', function() {
      img.attr('src', src_on);
    });
    a.bind('mouseleave blur', function() {
      img.attr('src', src_off);
    });

  });
  
});
