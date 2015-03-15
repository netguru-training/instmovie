class Registrations::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def instagram

    if current_user
      Instagram::UpdateTokenService.new(current_user, env['omniauth.auth']).call
      redirect_to root_path
    else
      user = User.from_omniauth(request.env['omniauth.auth'])
      Instagram::UpdateInstagramProfileInfoService.new(user, env['omniauth.auth']).call
      Instagram::UpdateTokenService.new(user, env['omniauth.auth']).call
      sign_in_and_redirect user
    end
  end
end
