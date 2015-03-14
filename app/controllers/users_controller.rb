class UsersController < ApplicationController
  before_action :authenticate_user!

  def profile
  end

  def admin

  end

  expose(:movies)
  expose(:reviews)
end
