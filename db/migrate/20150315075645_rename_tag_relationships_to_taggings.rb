class RenameTagRelationshipsToTaggings < ActiveRecord::Migration
  def change
    rename_table :tag_relationships, :taggings
  end
end
