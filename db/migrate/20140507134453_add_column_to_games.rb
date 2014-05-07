class AddColumnToGames < ActiveRecord::Migration
  def change
    add_column :games, :kana, :string
  end
end
