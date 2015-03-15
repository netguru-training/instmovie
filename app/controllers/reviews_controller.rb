class ReviewsController < ApplicationController
  expose(:reviews)
  expose(:review, attributes: :review_params)

  def create
    if review.save
      redirect_to review, notice: 'Review was successfully created.'
    else
      render :new
    end
  end

  def update
    if review.save
      redirect_to review, notice: 'Review was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    review.destroy
    redirect_to reviews_url, notice: 'Review was successfully destroyed.'
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
