class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|

    end

    add_column :plays, :user_id, :integer, after: :game_id
  end
end
