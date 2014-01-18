# Helper method to include instance methods from a Mixin into a certain class
window.include = (_this, Class) ->
  included = new Class
  for attrname of included
    _this[attrname] = included[attrname]
  _this
