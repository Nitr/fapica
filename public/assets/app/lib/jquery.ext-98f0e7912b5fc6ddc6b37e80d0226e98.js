(function() {
  var $;
  $ = jQuery;
  $.prototype.serializeForm = function() {
    var item, result, _i, _len, _ref;
    result = {};
    _ref = $(this).serializeArray();
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      item = _ref[_i];
      result[item.name] = item.value;
    }
    return result;
  };
}).call(this);
