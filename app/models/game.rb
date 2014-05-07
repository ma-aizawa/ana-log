class Game < ActiveRecord::Base
  has_many :plays

  validates :name, :kana, :description, presence: true
end
