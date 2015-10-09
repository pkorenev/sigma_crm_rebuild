placeSearch = undefined
$address_autocomplete = undefined
autocomplete = undefined
componentForm = {
  street_number: 'short_name'
  route: 'long_name'
  locality: 'long_name'
  administrative_area_level_1: 'short_name'
  country: 'long_name'
  postal_code: 'short_name'
  sublocality_level_1: "short_name"
}



window.initializeAddressAutocomplete = ()->
# Create the autocomplete object, restricting the search
# to geographical location types.
  #alert("hello")

  $address_autocomplete = $("#building_complex_address_autocomplete")
  autocomplete = new (google.maps.places.Autocomplete)($address_autocomplete.get(0), language: 'uk')
  # When the user selects an address from the dropdown,
  # populate the address fields in the form.
  google.maps.event.addListener autocomplete, 'place_changed', ->
    #alert("hello")
    #console.log("IMPORTANT: value: ", $address_autocomplete.val())
    fillInAddress()
    return true


address_component_by_name = (place, component_name)->
  for c in place.address_components
    if c.types.indexOf(component_name) >= 0
      return c

  return null


fillInAddress = ->
# Get the place details from the autocomplete object.
  place = autocomplete.getPlace()
  $form = $address_autocomplete.closest("form")
  for component of componentForm
    #document.getElementById("address_autocomplete_#{component}").value = ''
    #document.getElementById(component).disabled = false
    $input = $form.find("[attr=#{component}]")
    console.log "component: ", component
    $input.val("")
    $input.removeAttr("disabled")



  # Get each component of the address from the place details
  # and fill the corresponding field on the form.
  i = 0

  console.log "while"
  console.log "place: ", place
  while i < place.address_components.length
    addressType = place.address_components[i].types[0]
    console.log("addressType: ", addressType)
    if componentForm[addressType]
      val = place.address_components[i][componentForm[addressType]]

      console.log("log: #{addressType}:", val)

      #document.getElementById(addressType).value = val
      $input = $form.find("[attr=#{addressType}]")
      $input.val(val)

      #document
    i++

  $house_number_input = $(".building_complex_house_number")
  $house_coordinates_input = $(".building_complex_coordinates")


  city = address_component_by_name(place, "locality").short_name
  district = address_component_by_name(place,"sublocality_level_1").short_name
  street = address_component_by_name(place, "route").short_name
  house_number = address_component_by_name(place, "street_number").short_name


  console.log "place-geometry -> --------------------------", place
  coordinates = "#{place.geometry.location.A}, #{place.geometry.location.F}"

  $form.find('[name*="[city]"]').val(city)
  $form.find('[name*="[district]"]').val(district)
  $form.find('[name*="[street]"]').val(street)
  $form.find('[name*="[house_number]"]').val(house_number)
  $form.find('[name*="[coordinates]"]').val(coordinates)


  if place.address_components[0].types[0] != "street_number"
    #alert("new coordinates")
    #$address_autocomplete
    #$address =
    $house_number_input.removeClass('hide')
    $house_coordinates_input.removeClass('hide')
  else
    $house_number_input.addClass("hide")
    $house_coordinates_input.addClass("hide")


  return true

console.log "$", $
$(document).on "ready", initializeAddressAutocomplete


