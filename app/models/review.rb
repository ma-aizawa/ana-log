class Review < ActiveRecord::Base
  belongs_to :play

  validates :game_id, :body, presence: true
end
