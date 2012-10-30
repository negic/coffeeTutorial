# Lightクラスを定義
class Light
  constructor: ->
    @powered = false # スイッチが入っているか否かフラグ
    @powerOnCallbacks = []
    @powerOffCallbacks = []
    @el = $('#light')
    @el.click => @toggle()
  powerOn: ->
    @powered = true
    @el.css 'background', 'yellow'
    # スイッチオン時に実行する関数を全部実行
    $.each @powerOnCallbacks, (i, callback) -> callback()
    @
  powerOff: ->
    @powered = false
    @el.css 'background', 'white'
    # スイッチオフ時に実行する関数を全部実行
    $.each @powerOffCallbacks, (i, callback) -> callback()
    @
  toggle: ->
    if @powered then @powerOff() else @powerOn()
    @
  onPowerOn: (callback) ->
    # スイッチオン時に実行する関数を保存
    @powerOnCallbacks.push callback
    @
  onPowerOff: (callback) ->
    # スイッチオフ時に実行する関数を保存
    @powerOffCallbacks.push callback
    @

# もろもろ実行
$ ->
  light = new Light
  light.onPowerOn -> alert 'light on!'
  light.onPowerOff -> alert 'light off!'
