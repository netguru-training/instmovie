class MoviesController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin, only: [:new, :create, :edit, :update, :destroy]
  expose(:movies)
  expose(:movie, attributes: :movie_params)

  def create
    if movie.save
      redirect_to movie, notice: 'Movie was successfully created.'
    else
      render :new
    end
  end

  def update
    if movie.save
      redirect_to movie, notice: 'Movie was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    movie.destroy
    redirect_to users_admin_path, notice: 'Movie was successfully destroyed.'
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

  private

  def movie_params
    params.require(:movie).permit(:title)
  end

  def check_admin
    return if current_user.admin?
    flash[:error] = "You must be admin."
    redirect_to new_user_session_path
  end
end
