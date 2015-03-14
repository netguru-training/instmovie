class UsersController < ApplicationController
  before_action :authenticate_user!
  expose(:movies)
  expose(:reviews)
  
  def profile
  end

  def admin
  end

  def omniauth_callbacks
    binding.pry
  end
end
