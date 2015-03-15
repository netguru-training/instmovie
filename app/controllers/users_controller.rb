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
  
  def suggested_films
    if current_user.present?
      @best_visual_effects = get_for_category('visual_effects')
      @best_scenario = get_for_category('scenario')
      @best_actors = get_for_category('actors')
    end
  end

  private

  def get_for_category(category)
    Suggestions::SuggestFilms.new(current_user).suggested_films(category)
  end
end
