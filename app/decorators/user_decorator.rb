class UserDecorator < Draper::Decorator
  delegate_all

  def identity
    (username.present?) ? username.capitalize : email
  end
end

