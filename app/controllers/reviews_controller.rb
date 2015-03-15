class ReviewsController < ApplicationController
  expose(:reviews)
  expose(:review, attributes: :review_params)
  expose(:movie)


  def create
    if review.save
      redirect_to movie_url(movie), notice: t('controllers.reviews.create.success_notice')
    else
      redirect_to movie_url(movie), notice: t('controllers.reviews.create.error_notice')
    end
  end

  def destroy
    review.destroy
    redirect_to movie_url(movie), notice: t('controllers.reviews.destroy.success_notice')
  end

  private

  def review_params
    params.require(:review).permit(:content).merge(movie_id: movie.id)
  end
end
