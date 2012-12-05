class User < ActiveRecord::Base
  has_many :moderates
  has_many :follows

  attr_accessible :email, :first_name, :last_name, :password, :password_confirmation, :username
  has_secure_password

  validates(:first_name, presence: true)
  validates(:last_name, presence: true)
  validates(:email, presence: true, format: { with: /@/i })
  validates(:username, presence: true, length: { minimum: 3 }, uniqueness: { case_sensitive: false })
  validates(:password, presence: true, length: { minimum: 3 }, confirmation: true)
  validates(:password_confirmation, presence: true)

  before_validation(on: :create) do |user|
    user.username = user.username.downcase
  end
end
