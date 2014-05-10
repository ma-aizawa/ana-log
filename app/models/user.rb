class User < ActiveRecord::Base
  def admin?
    self.id == 0
  end

  def guest?
    self.id == 9999
  end
end
