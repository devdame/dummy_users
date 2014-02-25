class User < ActiveRecord::Base
  has_secure_password

  def self.authenticate(user_name, password)
    user = User.where(user_name: user_name).first
    user.authenticate(password)
  end


end
