$(document).on "click", "tr a[role=delete]", (event)->
  event.preventDefault()
  event.stopImmediatePropagation()
  $link = $(this)
  href = $link.attr("href")
  console.log("href: ", href)
  format = 'json'
  url = "#{href}.#{format}"
  $.ajax({
    type: 'delete'
    url: url
    success: ()->
      $tr = $link.closest('tr')
      #$tr.fadeOut()
      footable = $tr.closest("table").data("footable")
      footable.removeRow($tr)
  })





$(document).on "click", "a[type=delete]", ()->
  event.preventDefault()

  $link = $(this)
  href = $link.attr("href")
  console.log("href: ", href)
  format = 'json'
  url = "#{href}.#{format}"
  hash = {
    type: 'delete'
    url: url
  }
  success_source = $link.attr("success")
  if success_source && success_source.length
    hash["success"] = ()->
      eval(success_source)

  error_source = $link.attr("error")
  if error_source && error_source.length
    hash["error"] = ()->
      eval(error_source)

  complete_source = $link.attr("complete")
  if complete_source && complete_source.length
    hash["complete"] = ()->
      eval(complete_source)


  $.ajax(hash)