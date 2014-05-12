class Game < ActiveRecord::Base
  has_many :plays

  validates :name, :kana, :description, presence: true

  mount_uploader :image, ImageUploader
end
