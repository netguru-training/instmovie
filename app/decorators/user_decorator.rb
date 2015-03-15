class UserDecorator < Draper::Decorator
  delegate_all

  def identity
    (username.present?) ? username.capitalize : email
  end

  def default_avatar
    if model.avatar.present? and model.avatar != default_instagram_avatar_url
      model.avatar
    else
      model.gravatar_url
    end
  end

  private

  def default_instagram_avatar_url
    'https://instagramimages-a.akamaihd.net/profiles/anonymousUser.jpg'
  end
end

