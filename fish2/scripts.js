// Generated by CoffeeScript 1.4.0
(function() {
  var Fish;

  Fish = (function() {

    function Fish() {
      this.el = $('<div class="fish">魚</div>');
    }

    Fish.prototype.startMoving = function() {
      var toLeft, toRight,
        _this = this;
      toRight = {
        left: 10
      };
      toLeft = {
        left: -10
      };
      this.el.animate(toRight);
      this.el.animate(toLeft, function() {
        return _this.startMoving();
      });
      return this;
    };

    return Fish;

  })();

  $(function() {
    var $aquarium, fish1, fish2, fish3;
    fish1 = new Fish;
    fish2 = new Fish;
    fish3 = new Fish;
    $aquarium = $('#aquarium');
    $aquarium.append(fish1.el);
    $aquarium.append(fish2.el);
    $aquarium.append(fish3.el);
    fish1.startMoving();
    fish2.startMoving();
    return fish3.startMoving();
  });

}).call(this);
