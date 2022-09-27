class User < ApplicationRecord

  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, presence: true, confirmation: true, length: { minimum: 6}
  validates :password_confirmation, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { without: /\s/ }
  
end
