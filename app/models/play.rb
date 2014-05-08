class Play < ActiveRecord::Base
  belongs_to :game
  has_one :review

  after_initialize :init

  validates :game_id, :date, presence: true

  def init
    self.date ||= Date.today
  end

  def game_name
    self.game.try(:name)
  end
end
