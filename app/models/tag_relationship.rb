class TagRelationship < ActiveRecord::Base
  belongs_to :tag, polymorphic: true
end