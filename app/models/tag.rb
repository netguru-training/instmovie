class Tag < ActiveRecord::Base
  has_many :tag_relationships, :through => :tags
end
