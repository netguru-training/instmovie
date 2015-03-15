class ReviewsController < ApplicationController
  expose(:reviews)
  expose(:review, attributes: :review_params)
  expose(:movies)

  def create
    if review.save
      redirect_to review, notice: t('controllers.reviews.create.success_notice')
    else
      render :new
    end
  end

  def update
    if review.save
      redirect_to review, notice: t('controllers.reviews.update.success_notice')
    else
      render :edit
    end
  end

  def destroy
    review.destroy
    redirect_to reviews_url, notice: t('controllers.reviews.destroy.success_notice')
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating, :movie_id)
  end
end
