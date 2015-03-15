class UsersController < ApplicationController
  before_action :authenticate_user!

  def profile
  end

  def admin

  end

  expose(:movies) {
    Movie.order("created_at DESC").all
  }
  expose(:reviews) {
    Review.order("created_at DESC").all
  }

  def profile
  end

  def admin
  end

  def omniauth_callbacks

  end
end
