class Review < ActiveRecord::Base
  belongs_to :play, dependent: :destroy

  validates :play_id, :body, presence: true

  mount_uploader :image, ImageUploader
end
