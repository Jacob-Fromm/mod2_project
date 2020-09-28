class User < ApplicationRecord

  validates :name, presence: true
  validates :email, email: true

  # password confirmation
  # validates :password, confirmation: true
  has_secure_password
end
