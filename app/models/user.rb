class User < ApplicationRecord

  validates :name, presence: true
  validates :username, email: true

  # password confirmation
  # validates :password, confirmation: true
  has_secure_password
end
