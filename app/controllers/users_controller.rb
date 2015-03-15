class UsersController < ApplicationController
  before_action :authenticate_user!

  expose(:movies) {
    Movie.order("created_at DESC").all
  }
  expose(:reviews) {
    Review.order("created_at DESC").all
  }

  def omniauth_callbacks

  end
end
