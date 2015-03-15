class User < ActiveRecord::Base
  devise :omniauthable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, omniauth_providers: [:instagram]

  has_many :taggings, as: :taggable
  has_many :tags, through: :taggings

  ratyrate_rater

  include Gravtastic
  gravtastic

  def self.from_omniauth(auth)
    where(username: auth['info']['nickname']).first_or_create! do |user|
      user.username = auth['info']['nickname']
      user.password = Devise.friendly_token[0,20]
    end
  end

  def email_required?
    false
  end
end
