# EventModuleクラスを定義
class EventModule
  on: (name, callback) ->
    @callbacks = {} unless @callbacks?
    @callbacks[name] = [] unless @callbacks[name]?
    @callbacks[name].push callback
    @
  trigger: (name) ->
    list = @callbacks?[name]
    return @ unless list # 何も登録されてなかったら何もしない
    for callback in list
      callback()
    @

# Lightクラスを定義
class Light extends EventModule
  constructor: ->
    @powered = false
    @el = $('#light')
    @el.click => @toggle()
  powerOn: ->
    @powered = true
    @el.css 'background', 'yellow'
    @trigger 'poweron' # poweronイベントをトリガー
    @
  powerOff: ->
    @powered = false
    @el.css 'background', 'white'
    @trigger 'poweroff' # poweroffイベントをトリガー
    @
  toggle: ->
    if @powered then @powerOff() else @powerOn()
    @

# もろもろ実行
$ ->
  light = new Light
  light.on 'poweron', -> alert 'light on!'
  light.on 'poweroff', -> alert 'light off!'
