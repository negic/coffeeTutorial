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

# テスト
ev = new EventModule
ev.on 'foo', -> alert 'foo!'
ev.trigger 'foo'

ev.on 'bar', -> alert 'bar1!'
ev.on 'bar', -> alert 'bar2!'
ev.on 'bar', -> alert 'bar3!'
ev.trigger 'bar'
