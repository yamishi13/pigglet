class User < ActiveRecord::Base
  has_many :deposits, dependent: :destroy
  has_many :withdrawals, dependent: :destroy

  def self.authenticate(username="", login_password="")
    user = User.find_by_username(username)
    if user && user.match_password(login_password)
      return user
    else
      return false
    end
  end

  def match_password(login_password="")
    password == login_password
  end
end
