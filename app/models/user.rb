class User < ActiveRecord::Base
  devise :omniauthable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, omniauth_providers: [:instagram]

  has_many :taggings, as: :taggable
  has_many :tags, through: :taggings

  ratyrate_rater

  def self.from_omniauth(auth)
    where(username: auth.uid).first_or_create do |user|
      user.username = auth.uid
      user.password = Devise.friendly_token[0,20]
    end
  end
end
