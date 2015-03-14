class UsersController < ApplicationController
  before_action :authenticate_user!

  def profile
  end

  def admin

  end

  expose(:movies)
  expose(:reviews)
  
  def profile
  end

  def admin
  end

  def omniauth_callbacks

  end
end
