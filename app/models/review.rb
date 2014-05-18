class Review < ActiveRecord::Base
  belongs_to :play

  validates :play_id, :body, presence: true

  mount_uploader :image, ImageUploader
end
