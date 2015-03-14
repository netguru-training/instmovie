$ ->
  $( ".alert" ).on "click", ->
    $( this ).slideUp()

  setTimeout ->
    $( ".alert" ).off( "click" ).slideUp()
  , 4000

  $( "select.search" ).select2();