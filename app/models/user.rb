class User < ActiveRecord::Base
  has_many :moderates
  has_many :follows

  attr_accessible :email, :first_name, :last_name, :password_digest, :username
  has_secure_password

  
end
