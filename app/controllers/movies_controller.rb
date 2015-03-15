class MoviesController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin, only: [:new, :create, :edit, :update, :destroy]
  before_action :auto_generate_tag, only: [:create, :update]
  expose(:movies)
  expose(:movie, attributes: :movie_params)
  expose(:review) { movie.reviews.build }
  expose(:reviews) { movie.reviews }


  def create
    if movie.save
      redirect_to movie, notice: t('controllers.movies.create.success_notice')
    else
      render :new
    end
  end

  def update
    if movie.save
      redirect_to movie, notice: t('controllers.movies.update.success_notice')
    else
      render :edit
    end
  end

  def destroy
    movie.destroy
    redirect_to users_admin_path, notice: t('controllers.movies.destroy.success_notice')
  end

  def search
    movies = Movie.sounds_kinda_like(params[:q]).all
    results = []

    movies.each_with_index do |movie, index|
      results.push({
                       id: movie.id,
                       count: movie.reviews.length,
                       movie: movie,
                       title: movie.title,
                       rating: movie.reviews.calculate( "average", "rating" ).round( 2 ),
                       reviews_count: movie.reviews.count,
                       uri: url_for( controller: "movies", action: "show", id: movie.id )
                   })
    end

    render :json => results
  end

  def auctions
    require 'open-uri'

    id = params[:id]

    # Current movie
    movie = Movie.where(id: params[:id]).first

    search = movie.title.gsub(/\s/, '+').gsub(/[[:punct:]]/, '')

    # URL template
    uri = 'http://allegro.pl/rss.php?feed=search&?category=20585&limit=180&order=m&' +
      'search_scope=category-20585&string=' + search

    # RSS channel content
    content_xml = open( uri ).read

    # Parsed XML
    content = Hash.from_xml( content_xml )

    @auctions_list = get_auctions content

    render :partial => '/movies/auctions'
  end

  protected

  def get_auctions( content )
    # require 'rubygems'
    require 'hpricot'

    # Auctions
    auctions_list = []

    count = 0

    content["rss"]["channel"]["item"].each do |item|
      auction = Hash.new

      # binding.pry

      next if item.class == Array

      doc = Hpricot( item[ "description" ] )
      imgs = doc.search( "img" )

      has_img = false

      imgs.each do |img|
        has_img = true
        auction[:img] = img.attributes[ "src" ]
        break
      end

      # Skip auctions with no images
      next if not has_img

      count += 1

      auction[:name] = item[ "title" ].to_s
      auction[:uri] = item[ "link" ].to_s


      auctions_list.push auction

      break if count == 10
    end

    auctions_list
  end

  def auto_generate_tag
    # Auto-generate tags
    if movie.instagram_tag.length == 0
      movie.instagram_tag = movie.title.gsub(/\s/, '').gsub(/[[:punct:]]/, '').downcase! << "movie"
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :instagram_tag, :picture)
  end

  def check_admin
    return if current_user.admin?
    flash[:error] = t('controllers.movies.check_admin.error')
    redirect_to new_user_session_path
  end
end
