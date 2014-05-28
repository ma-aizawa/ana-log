class AddLoginParamsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :user_id, :string
    add_column :users, :key_phrase, :string
  end
end
