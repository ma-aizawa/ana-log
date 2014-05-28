class User < ActiveRecord::Base
  validates :user_id, :key_phrase, presence: true

  def admin?
    self.id == 0
  end

  def guest?
    self.id == 9999
  end

  def match_key?(key_phrase)
    self.key_phrase == Digest::SHA1.hexdigest(key_phrase)
  end
end
