// Generated by CoffeeScript 1.3.3
(function() {

  $(function() {
    return $('.rollover').each(function() {
      var a, img, src_off, src_on;
      a = $(this);
      img = a.find('img');
      src_off = img.attr('src');
      src_on = src_off.replace('_off', '_on');
      $('<img />').attr('src', src_on);
      a.bind('mouseenter focus', function() {
        return img.attr('src', src_on);
      });
      return a.bind('mouseleave blur', function() {
        return img.attr('src', src_off);
      });
    });
  });

}).call(this);
