class Movie < ActiveRecord::Base
  has_many :reviews

  validates :title , presence: true

  ratyrate_rateable 'visual_effects', 'scenario', 'actors'

  include PgSearch
  pg_search_scope :sounds_kinda_like,
    :against => :title,
    :using => {
      :tsearch => {
        :prefix => true
      }
    },
    :ranked_by => ":tsearch"
  multisearchable :against => [:title]
end
