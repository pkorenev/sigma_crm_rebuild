$(".new-manager-invitation").on("click", (event)->
  event.preventDefault()
  email = prompt("Введіть електронну пошту")
  if email && email.length
    $this = $(this)
    $form = $this.closest("form")
    $email_input = $form.find('[name*="[email]"]')
    $email_input.val(email)
    link_url = $this.attr("href")
    post_url = $this.attr("data-post-url")
    request_url = post_url + ".json"
    request_data = { manager: { email: email}}



    csrf_data = {"csrf-param": $("[name=csrf-param]").attr("content"), "csrf-token": $("[name=csrf-token]").attr("content")}
    csrf_data = {}
    #csrf_data[$("[name=csrf-param]").attr("content")] = $("[name=csrf-token]").attr("content")
    #csrf_data["authenticity_token"] = $this.attr("data-token")
    #request_data = $.extend(request_data, csrf_data)
    #request_data = $.merge(request_data, $this.closest("form").serializeArray())




    $.ajax(request_url,
      #beforeSend: (xhr)->
      #  xhr.setRequestHeader('X-CSRF-Token', Cookies.get("XSRF-TOKEN"))
      type: "post"
      dataType: "json"
      data: request_data
      success: ()->
        alert "invitation sent"
      error: ()->
        alert("error")
    )

    #$form = $($0).closest("form"); $.ajax({type: "post", dataType: "json", url: $form.attr("action") + ".json", data: $form.find("input[type=text]").serialize()})
)

$(document).on "ready", ()->
  $select_wrap = $(".multiple-selects")
  $source_select = $select_wrap.find("select")
  $source_select.addClass("hide")
  $complexes_select = $("<select>")
  $houses_select = $("<select>")

  $source_select.find("optgroup").each (id)->
    $(this).attr("data-order-id", id + 1)
    complex_name = $(this).attr("label")
    $complexes_select.append("<option value='#{id+1}'>#{complex_name}</option>")

  $select_wrap.append($complexes_select)
  $complexes_select.on "change", ()->
    complex_id = $(this).val()
    #alert(complex_id)
    $houses_select.children().remove()
    $source_subitems = $source_select.find("optgroup[data-order-id=#{complex_id}]").children()
    $source_subitems.clone().appendTo($houses_select)
    console.log "$source_subitems: ", $source_subitems
    if $houses_select.parent().length == 0
      $houses_select.appendTo($select_wrap)
  $houses_select.on "change", ()->
    house_id = $(this).val()
    $source_select.val(house_id)




