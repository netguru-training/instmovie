class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :omniauthable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauth_providers => [:instagram]

  has_many :tag_relationships, :through => :tags, class_name: 'TagRelationships'
  has_many :tags
end
