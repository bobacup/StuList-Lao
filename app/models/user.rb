class User < ActiveRecord::Base
  before_save { self.username = username.downcase }
  before_save { self.email = email.downcase }
  validates :first_name,  presence: true, length: { maximum: 50 }
  validates :last_name,  presence: true, length: { maximum: 50 }
  validates :username,  presence: true, length: { minimum: 6 }, uniqueness: { case_sensitive: false }
  VALID_ZIPCODE_REGEX = /\A\d{5}-\d{4}|\A\d{5}\z/
  validates :zipcode,  presence: true, format: { with: VALID_ZIPCODE_REGEX }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 6 }
end
