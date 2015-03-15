$ ->
  $( ".admin .more" ).on "click", ->
    $this = $ this

    # Return if pagination in progress
    return if $this.hasClass "loading"

    $this.addClass "loading"

    setTimeout ->
      $all = $this.siblings( ":visible:last" ).nextAll().not( $this )
      $to_show = $this.siblings( ":visible:last" ).nextAll( "*:lt(10)" ).not( $this ).removeClass "hidden"
      if $to_show.length is $all.length
        $this.addClass "hidden"
      else
        $this.removeClass "loading"
    , 300