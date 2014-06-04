class User < ActiveRecord::Base
  validates :user_id, :key_phrase, presence: true
  validates :user_id, uniqueness: true

  def admin?
    self.id == 1
  end

  def guest?
    self.id == 2
  end

  def match_key?(key_phrase)
    self.key_phrase == Digest::SHA1.hexdigest(key_phrase)
  end

  class << self
    def create!(attrs = {})
      key_phrase = attrs[:key_phrase]
      attrs[:key_phrase] = Digest::SHA1.hexdigest(key_phrase)
      super(attrs)
    end

    def find_guest
      guest = User.find_by_id(2) || User.create!(id: 2, user_id: 'guest', key_phrase: 'guest')
      guest
    end
  end
end
