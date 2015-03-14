class Movie < ActiveRecord::Base
  has_many :reviews

  validates :title , presence: true

  ratyrate_rateable 'visual_effects', 'scenario', 'actors'
end
