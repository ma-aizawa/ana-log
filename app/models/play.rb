class Play < ActiveRecord::Base
  belongs_to :game
  belongs_to :user, dependent: :destroy
  has_one :review

  after_initialize :init

  validates :game_id, :user_id, :date, presence: true

  def init
    self.date ||= Date.today
  end

  def game_name
    self.game.try(:name)
  end
end

