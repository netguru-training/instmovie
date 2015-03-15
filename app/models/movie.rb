class Movie < ActiveRecord::Base
  has_many :reviews, dependent: :destroy
  has_many :taggings, as: :taggable
  has_many :tags, through: :taggings

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


  def average_rating(category)
    rates = Rate.where(rateable_id: self.id, dimension: category).pluck(:stars)
    rates.inject{ |sum, el| sum + el }.to_f / rates.size
  end

end