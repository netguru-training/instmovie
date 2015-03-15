class AddAttachmentPictureToMovies < ActiveRecord::Migration
  def self.up
    change_table :movies do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :movies, :picture
  end
end
