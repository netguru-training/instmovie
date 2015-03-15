# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  class TagMap
    constructor: ->
      @.$canvas = $ "#map-canvas"

      # Don't do anything is there is no map canvas
      return if @.$canvas.length is 0

      google.maps.event.addDomListener window, 'load', @.init
      @.loadMarkers()

    init: ->
      mapOptions =
        zoom: 2,
        center: new google.maps.LatLng( 0, 0 )

      @.map_obj = new google.maps.Map document.getElementById( "map-canvas" ), mapOptions

    loadMarkers: ->
      @.id = 1

      @.loadMarkersContinue()

    hideCrunching: ->
      $( ".crunching" ).hide()

    loadMarkersContinue: ->
      self = @

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
            labelContent: "<a href=\"" + marker.uri + "\">" + marker.name + "</a>",
            labelAnchor: new google.maps.Point(22, 0),
            labelClass: "btn btn-info btn-xs map-label"

        if not response.finished
          self.id++
          setTimeout ->
            self.loadMarkersContinue()
          , 300
        else
          self.hideCrunching()

  tag_map = new TagMap()