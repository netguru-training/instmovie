class MapController < ApplicationController
  def show
  end

  def markers
    require "json"
    require 'open-uri'

    markers = []

    id = params[:id]

    # Current movie
    movie = Movie.where(id: params[:id]).first

    # All the next movies counter
    next_movies_count = Movie.where('id > ?', params[:id]).count

    # Build URL with tag name
    uri = "https://api.instagram.com/v1/tags/#{movie.instagram_tag}/media/recent"

    # Add instagram client ID for auth
    uri << "?client_id=" << ENV['INSTAGRAM_CLIENT_ID']

    # Get contents as JSON
    content = JSON.parse( open( uri ).read )

    content[ "data" ].each do |item|
      if item[ "location" ]
        markers.push({
          latitude: item[ "location" ][ "latitude" ],
          longitude: item[ "location" ][ "longitude" ],
          name: movie.title,
          uri: url_for( movie_path(movie.id ) )
        })
      end
    end

    render json: {
      finished: next_movies_count == 0,
      markers: markers
    }
  end
end
