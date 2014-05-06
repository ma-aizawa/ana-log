class Game < ActiveRecord::Base
  has_many :reviews

  validates :name, :description, presence: true
end
