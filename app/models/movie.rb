class Movie < ActiveRecord::Base

  has_many :reviews

  validates :title , presence: true

  ratyrate_rateable 'visual_effects', 'scenario', 'actors'

  include PgSearch
  pg_search_scope :search_by_title, :against => :title
  multisearchable :against => [:title]
end
