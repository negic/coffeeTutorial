$ ->

  $('.rollover').each ->

    # jQueryオブジェクトを用意
    a = $(@)
    img = a.find 'img'

    # 通常時・マウスオーバー時のsrc属性を用意
    src_off = img.attr 'src'
    src_on = src_off.replace '_off', '_on'

    # 画像をプリロード
    $('<img />').attr 'src', src_on

    # イベントを設定
    a.bind 'mouseenter focus', ->
      img.attr 'src', src_on
    a.bind 'mouseleave blur', ->
      img.attr 'src', src_off
