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
    $.each @powerOnCallbacks, (i, callback) -> callback()
    @
  powerOff: ->
    @powered = false
    @el.css 'background', 'white'
    $.each @powerOffCallbacks, (i, callback) -> callback()
    @
  toggle: ->
    if @powered then @powerOff() else @powerOn()
    @
  onPowerOn: (callback) ->
    @powerOnCallbacks.push callback
    @
  onPowerOff: (callback) ->
    @powerOffCallbacks.push callback
    @

# もろもろ実行
$ ->
  light = new Light
  light.onPowerOn -> alert 'light on!'
  light.onPowerOff -> alert 'light off!'
