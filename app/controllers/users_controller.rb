class UsersController < ApplicationController
  before_action :authenticate_user!
  expose(:movies)
  expose(:reviews)
end
