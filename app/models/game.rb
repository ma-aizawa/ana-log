class Game < ActiveRecord::Base
  has_many :plays

  validates :name, :description, presence: true
end
