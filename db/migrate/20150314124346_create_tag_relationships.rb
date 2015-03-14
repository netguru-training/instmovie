class CreateTagRelationships < ActiveRecord::Migration
  def change
    create_table :tag_relationships do |t|
      t.integer :tag_id

      t.references :taggable, polymorphic: true
    end
  end
end
