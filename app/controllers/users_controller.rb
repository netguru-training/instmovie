class UsersController < ApplicationController
  before_action :authenticate_user!

  def profile
  end

  def admin
    @movies = Movie.order(created_at: :desc).all
    @reviews = Review.order(created_at: :desc).all
  end
end
