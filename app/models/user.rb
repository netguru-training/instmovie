class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :omniauthable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauth_providers => [:instagram]

  has_many :tag_relationships, :through => :tags, class_name: 'TagRelationships'
  has_many :tags
  
  ratyrate_rater

  def self.from_omniauth(auth)
    where(username: auth.uid).first_or_create do |user|
      user.username = auth.uid
      user.password = Devise.friendly_token[0,20]
    end
  end


end
