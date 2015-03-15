# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  class TagMap
    constructor: ->
      self = @

      @.$canvas = $ "#map-canvas"
      @.is_single = $( ".map-wrapper" ).hasClass "movie"

      console.log( "is_single" ,@.is_single )

      # Don't do anything is there is no map canvas
      return if @.$canvas.length is 0

      zoom = if @.is_single then 1 else 2

      google.maps.event.addDomListener window, 'load', @.init( zoom )
      @.setHandlers()
      setTimeout ->
        self.loadMarkers()
      , 1000

    init: ( zoom ) ->
      mapOptions =
        zoom: zoom,
        center: new google.maps.LatLng( 20, 0 )

      window.map_obj = new google.maps.Map document.getElementById( "map-canvas" ), mapOptions

    loadMarkers: ->
      @.id = if @.is_single then parseInt( $( ".map-wrapper.movie" ).attr( "movie" ), 10 ) else 1

      @.loadMarkersContinue()

    hideCrunching: ->
      $( ".crunching" ).hide()

    imgCreate: ( img_url ) ->
      $img = $( "<img>" ).attr "src", img_url
        .addClass "img-hover"
        .prependTo "body"

    imgFollowMouse: ( event ) ->
      $ "img.img-hover"
        .css
          left: event.pageX - $( window ).scrollLeft() - 170
          top: event.pageY - $( window ).scrollTop() - 20

    imgDestroy: ( img_url ) ->
      $ "img.img-hover"
        .remove()

    setHandlers: ->
      self = @

      $( document ).on "mouseenter mousemove mouseleave", ".map-label a", ( event ) ->
        img_url = $( this ).attr "img-url"

        if event.type is "mouseenter"
          self.imgCreate img_url
          self.imgFollowMouse event

        if event.type is "mousemove"
          self.imgFollowMouse event

        if event.type is "mouseleave"
          self.imgDestroy()

    loadMarkersContinue: ->
      self = @

      console.log "loadMarkersContinue id", @.id

      # Request tags for an id
      xhr = $.ajax
        url: "/map/markers/" + @.id

      xhr.success ( response )->
        $.each response.markers, ( index, marker ) ->
          lat_lng = new google.maps.LatLng( marker.latitude, marker.longitude )

          marker_obj = new MarkerWithLabel
            position: lat_lng,
            map: map_obj,
            title: marker.name,
            labelContent: "<a href=\"" + marker.uri + "\" img-url=\"" + marker.photo +
              "\">" + marker.name + "</a>",
            labelAnchor: new google.maps.Point(22, 0),
            labelClass: "btn btn-info btn-xs map-label"

        if response.markers.length is 0
          $( ".no-photos" ).removeClass "hidden"

        if not response.finished
          return if self.is_single

          self.id++
          setTimeout ->
            self.loadMarkersContinue()
        else
          self.hideCrunching()

  tag_map = new TagMap()