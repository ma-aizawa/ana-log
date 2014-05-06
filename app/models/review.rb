class Review < ActiveRecord::Base
  belongs_to :game


  validates :game_id, :body, presence: true
end
