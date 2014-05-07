class Play < ActiveRecord::Base
  belongs_to :game
  has_one :review

  after_initialize :init

  validates :game_id, :name, presence: true

  delegate :game_name, to: :game

  def init
    self.date ||= Date.today
  end
end
