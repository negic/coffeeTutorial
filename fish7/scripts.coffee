# ランダムな数値を作る関数
randomNum = (from, to) ->
  floor = Math.floor
  random = Math.random
  from + floor( random() * (to - from + 1) )

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

# Fishクラスを定義
class Fish

  constructor: (options) ->

    # デフォルトのオプション値を渡されたオプションで上書きする
    @options = $.extend {}, @defaultOptions, options

    # もろもろ準備
    @_prepareEls()
    @_handleColors()
    @_eventify()
    @_positionRandomly()

  # デフォルトのオプション値
  defaultOptions:
    speed: 400
    color: 'black'
    src: '<div class="fish"><div>魚</div></div>'

  # 内部的に呼ばれるメソッド群

  _prepareEls: ->
    @el = $(@options.src)
    @inner = $('div', @el)
    @
  _handleColors: ->
    @inner.css
      'color': @options.color
      'border-color': @options.color
    @
  _eventify: ->
    @el.on 'mouseenter', => @stop()
    @
  _positionRandomly: ->
    # ランダムに位置を指定
    @el.css
      left: randomNum 20, 260
      top: randomNum 20, 160
    @

  # 外部からも呼ばれるメソッド群
  
  startMoving: ->
    toRight = left: 10
    toLeft = left: -10
    s = @options.speed
    @inner.animate toRight, s
    @inner.animate toLeft, s, =>
      @startMoving()
    @
  stop: ->
    @inner.stop true
    @

# Aquariumクラスを定義
class Aquarium
  constructor: ->
    @el = $('#aquarium')
    @fishItems = [] # fishインスタンスらを保存しておく配列
  addFish: (options) ->
    fish = new Fish options
    @el.append fish.el
    @fishItems.push fish # 作ったfishインスタンスを保存
    @
  startAll: ->
    # 全部開始
    $.each @fishItems, (i, fish) -> fish.startMoving()
    @
  stopAll: ->
    # 全部停止
    $.each @fishItems, (i, fish) -> fish.stop()
    @

# もろもろ実行
$ ->
  aquarium = new Aquarium
  light = new Light

  aquarium.addFish() # オプション無し実行
  aquarium.addFish { speed: 200, color: 'red' }
  aquarium.addFish { speed: 300, color: 'orange' }
  aquarium.addFish { speed: 400, color: 'blue' }

  light.on 'poweron', -> aquarium.startAll()
  light.on 'poweroff', -> aquarium.stopAll()
