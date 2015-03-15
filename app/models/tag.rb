class Tag < ActiveRecord::Base
  has_many :taggings, dependent: :destroy
  has_many :users, through: :taggings, source: :taggable, source_type: 'User'
  has_many :movies, through: :taggings, source: :taggable, source_type: 'Movie'
end
