class UsersController < ApplicationController
  before_action :authenticate_user!

  expose(:movies) {
    Movie.order("created_at DESC").all
  }
  expose(:reviews) {
    reviews = Review.order("created_at DESC")

    if action_name == "profile"
      reviews = reviews.where(user_id: current_user.id)
    end

    reviews.all
  }

  def omniauth_callbacks

  end

  def profile
  end
end
