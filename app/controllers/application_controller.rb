class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index
  end

  protected
    def after_sign_in_path_for(resource)
      if current_user.admin?
        redirect_to users_admin_path
      else
        redirect_to users_profile_path
      end
    end

    def after_sign_up_path_for(resource)
      if current_user.admin?
        redirect_to users_admin_path
      else
        redirect_to users_profile_path
      end
    end

end