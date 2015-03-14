class MoviesController < ApplicationController
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
    redirect_to movies_url, notice: 'Movie was successfully destroyed.'
  end

  private
  def movie_params
    params.require(:movie).permit(:title)
  end
end
