class ChangeUsers < ActiveRecord::Migration
  def change
    add_column :users, :username,:string, null: true
    change_column :users, :email,:string, null: true, default: nil
  end
end
