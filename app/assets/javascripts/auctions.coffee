$ ->
  $auctions_wrapper = $( ".auctions-wrapper" )

  return if not $auctions_wrapper.length

  id = $auctions_wrapper.attr "movie"

  xhr = $.ajax
    url: "/movies/auctions/" + id

  xhr.success ( response ) ->
    $auctions_wrapper.html( response )

    # Height fix
    height = 0
    $( ".auction" ).each ->
      height = Math.max( height, $( this ).outerHeight() )
    .css "height", height

