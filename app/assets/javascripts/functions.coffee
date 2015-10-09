_original_indexOf = Array.prototype.indexOf
Array.prototype.indexOf = (value)->
  if typeof value == 'function'
    for item, index in this
      res = value.call(this, item)
      return index if res
    return -1
  else
    return _original_indexOf.call(this, value)
