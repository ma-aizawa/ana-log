class AddUniqueConstraintToUsers < ActiveRecord::Migration
  def change
    add_index :users, :user_id, unique: true
  end
end
