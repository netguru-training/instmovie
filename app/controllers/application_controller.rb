class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end
  
  def index
  end

  protected
    def after_sign_in_path_for(resource)
      check_admin
    end

    def after_sign_up_path_for(resource)
      check_admin
    end

    def check_admin
      if current_user.admin?
        users_admin_url
      else
        users_profile_url
      end
    end

end

