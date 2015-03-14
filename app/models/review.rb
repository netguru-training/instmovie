class Review < ActiveRecord::Base
  belongs_to :movie

  validates :rating, :content, presence: true
end
