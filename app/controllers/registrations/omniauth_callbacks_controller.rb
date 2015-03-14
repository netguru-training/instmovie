class Registrations::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def instagram
    if current_user!= nil
      current_user.update(access_token: env['omniauth.auth']['credentials']['token'])
      redirect_to root_path
    else
      @user = User.from_omniauth(request.env["omniauth.auth"])
      @user.update(access_token: env['omniauth.auth']['credentials']['token'])
      sign_in_and_redirect @user
    end
    #current_user.update(access_token: env['omniauth.auth']['credentials']['token'])
  end
end
