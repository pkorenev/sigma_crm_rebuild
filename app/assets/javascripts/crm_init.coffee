window.$html = $("#html")
window.action = $html.attr("data-action")
window.controller = $html.attr("data-controller")

window.data ?= {}

#$.ajaxSetup({
#  headers: {
#    #'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
#    'X-CSRF-Token': Cookies.get("XSRF-TOKEN")
#  }
#});