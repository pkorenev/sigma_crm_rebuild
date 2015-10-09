if controller == 'apartment_houses' && (action == 'edit' || action == 'new' )


  $.ajax "/building_complexes.json",
    dataType: 'json'
    success: (data)->
      window.data.apartment_houses = data
  $(document).on "change", "#apartment_house_parent_id", (event)->
    $this = $(this)
