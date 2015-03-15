class UserDecorator < Draper::Decorator
  delegate_all

  def identity
    (username.present?) ? username.capitalize : email
  end

  def has_avatar
    model.avatar and model.avatar != 'https://instagramimages-a.akamaihd.net/profiles/anonymousUser.jpg'
  end
end

