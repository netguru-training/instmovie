class Registrations::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def instagram
    @user = User.from_omniauth(request.env["omniauth.auth"])
    @user.update(access_token: env['omniauth.auth']['credentials']['token'])
    sign_in_and_redirect @user
    #current_user.update(access_token: env['omniauth.auth']['credentials']['token'])
  end
end
