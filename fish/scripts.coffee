# Fishクラスを定義
class Fish
  constructor: ->
    @el = $('<div class="fish">魚</div>')

# もろもろ実行
$ ->
  fish1 = new Fish
  fish2 = new Fish
  fish3 = new Fish
  $aquarium = $('#aquarium')
  $aquarium.append fish1.el
  $aquarium.append fish2.el
  $aquarium.append fish3.el
