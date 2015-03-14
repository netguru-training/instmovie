class UsersController < ApplicationController
  before_action :authenticate_user!

  def profile
  end

  def admin
    @movies = Movie.all
    @reviews = Review.all
  end
end
