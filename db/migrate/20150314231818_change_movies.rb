class ChangeMovies < ActiveRecord::Migration
  def change
    add_column :movies, :instagram_tag, :string, null: false, default: ''
  end
end
