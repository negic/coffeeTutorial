# Fishクラスを定義
class Fish
  constructor: (options) ->
    @options = options
    @el = $('<div class="fish">魚</div>')
    @el.css
      'color': @options.color
      'border-color': @options.color
  startMoving: ->
    toRight = left: 10
    toLeft = left: -10
    s = @options.speed
    @el.animate toRight, s
    @el.animate toLeft, s, => @startMoving()
    @

# もろもろ実行
$ ->
  fish1 = new Fish { speed: 200, color: 'red' }
  fish2 = new Fish { speed: 300, color: 'orange' }
  fish3 = new Fish { speed: 400, color: 'blue' }
  $aquarium = $('#aquarium')
  $aquarium.append fish1.el
  $aquarium.append fish2.el
  $aquarium.append fish3.el
  fish1.startMoving()
  fish2.startMoving()
  fish3.startMoving()
