class User < ActiveRecord::Base
  has_many :moderates, :dependent => :destroy
  has_many :follows, :dependent => :destroy
  has_many :runs, :dependent => :destroy
  has_many :comments, :dependent => :destroy

  attr_accessible :email, :first_name, :last_name, :password, :password_confirmation, :username, :avatar
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  has_secure_password

  validates(:first_name, presence: true)
  validates(:last_name, presence: true)
  validates(:email, presence: true, format: { with: /@.+\.[a-z]+/i }, uniqueness: { case_sensitive: false })
  validates(:username, presence: true, length: { minimum: 3 }, uniqueness: { case_sensitive: false })
  validates(:password, presence: true, length: { minimum: 3 }, confirmation: true)
  validates(:password_confirmation, presence: true)

  before_validation(on: :create) do |user|
    if user.username =~ /@/i
      user.username = user.username.sub(/@/, "")
    end
    user.username = user.username.downcase
    user.email = user.email.downcase
    create_remember_token
  end

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
