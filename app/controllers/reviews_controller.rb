class ReviewsController < ApplicationController
  before_action :check_user_reviews, only: [:create]
  expose(:reviews)
  expose(:review, attributes: :review_params)
  expose(:movie) 


  def create
    if review.valid?
      review.user = current_user
      movie.reviews << review
      redirect_to movie_url(movie), notice: t('controllers.reviews.create.success_notice')
    else
      flash[:error] = t('controllers.reviews.create.error_notice')
      redirect_to movie_url(movie)
    end
  end

  def update
    if review.valid?
      review.save
      redirect_to movie_url(movie), notice: t('controllers.reviews.create.success_notice')
    else
      flash[:error] = t('controllers.reviews.create.error_notice')
      redirect_to movie_url(movie)
    end
  end


  def destroy
    review.destroy
    redirect_to movie_url(movie.id), notice: t('controllers.reviews.destroy.success_notice')
  end

  private

  def review_params
    params.require(:review).permit(:content).merge(movie_id: movie.id)
  end

  def check_user_reviews
    user_reviews = 0
    movie.reviews.each { |review| user_reviews += 1 if review.user == current_user }
    if user_reviews > 0
      flash[:error] = "One review is enough."
      redirect_to movie_url(movie)
    end
  end
end
