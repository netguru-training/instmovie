$ ->
  # Ability to remove alerts on click
  $( ".alert" ).on "click", ->
    $( this ).slideUp()

  # Remove alerts after 4 seconds
  setTimeout ->
    $( ".alert" ).off( "click" ).slideUp()
  , 4000

  # Search engine
  $( ".search select" ).select2
    width: "250px"
    placeholder: "Type to search a movie"
    closeOnSelect: false
    ajax:
      delay: 100
      url: "/search/movies"
      processResults: ( data ) ->
        current = 0
        results = []
        max = 3

        $( data ).each ( key, entry ) ->
          if current < max
            results.push entry
          current++

        if current > max
          results.push
            id: 0
            more: current - max

        { results }

    templateResult: ( item ) ->
      # Return undefined if that's a native item
      return if item.disabled

      # Return notice about pending items
      return $( "<li>" + item.more + " more</li>" ) if item.more

      # Return clickable item with reviews - ugly, but works
      $( "<a href=\"" + item.uri + "\"><li>" + item.title + "<br>" +
        "<small>" +
        (
          if item.rating
          then "Rated <strong>" + item.rating + "</strong> of 5 by " + item.reviews_count + " " +
            ( if item.reviews_count > 1
            then "people"
            else "person" )
          else "Not yet rated" ) +
        "</small></li></a>" )

  $( ".navbar-brand" )
    .on "mouseenter", ->
      $( this ).addClass "animated tada hovered"
    .on "mouseleave", ->
      $this = $ this
      $( this ).removeClass "hovered"
      setTimeout ->
        if not $this.hasClass "hovered"
          $this.removeClass "animated tada"
      , 1000