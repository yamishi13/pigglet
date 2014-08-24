class User < ActiveRecord::Base
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
