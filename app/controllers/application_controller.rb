class ApplicationController < ActionController::Base
  #after_action :redirect_to_apprioprate_profile, if: :devise_controller? && :devise
  protect_from_forgery with: :exception

  protected
    /def redirect_to_apprioprate_profile
      if current_user.admin?
        redirect_to users_admin_path
      else
        redirect_to users_profile_path
      end
    end/
    def after_sign_in_path_for(resource)
      binding.pry
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
