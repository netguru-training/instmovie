$ ->
  $( ".alert" ).on "click", ->
    $( this ).slideUp()

  setTimeout ->
    $( ".alert" ).off( "click" ).slideUp()
  , 4000