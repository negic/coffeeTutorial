# Lightクラスを定義
class Light
  constructor: ->
    @powered = false # スイッチが入っているか否かフラグ
    @el = $('#light')
    @el.click => @toggle()
  powerOn: ->
    @powered = true
    @el.css 'background', 'yellow'
    @
  powerOff: ->
    @powered = false
    @el.css 'background', 'white'
    @
  toggle: ->
    if @powered then @powerOff() else @powerOn()
    @

# もろもろ実行
$ ->
  light = new Light
