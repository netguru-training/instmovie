class MoviesController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin, only: [:new, :create, :edit, :update, :destroy]
  expose(:movies)
  expose(:movie, attributes: :movie_params)

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

  private

  def movie_params
    params.require(:movie).permit(:title, :picture)
  end

  def check_admin
    return if current_user.admin?
    flash[:error] = t('controllers.movies.check_admin.error')
    redirect_to new_user_session_path
  end
end
