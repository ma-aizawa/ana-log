class RemoveColumnFromReviews < ActiveRecord::Migration
  def change
    rename_column :reviews, :game_id, :play_id
  end
end
