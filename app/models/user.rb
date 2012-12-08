class User < ActiveRecord::Base
  has_many :moderates
  has_many :follows
  has_many :runs

  attr_accessible :email, :first_name, :last_name, :password, :password_confirmation, :username
  has_secure_password

  validates(:first_name, presence: true)
  validates(:last_name, presence: true)
  validates(:email, presence: true, format: { with: /@/i }, uniqueness: { case_sensitive: false })
  validates(:username, presence: true, format: { with: /^@/i }, length: { minimum: 3 }, uniqueness: { case_sensitive: false })
  validates(:password, presence: true, length: { minimum: 3 }, confirmation: true)
  validates(:password_confirmation, presence: true)

  before_validation(on: :create) do |user|
    user.username = user.username.downcase
    user.email = user.email.downcase
    create_remember_token
  end

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
