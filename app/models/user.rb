class User < ApplicationRecord

    has_many :trips
    has_many :parks, through: :trips
    validates :name, presence: true
    #validates :email, presence: true
  
    # validates email format
    validates :email, email: true

  # password confirmation
  # validates :password, confirmation: true
  has_secure_password
end
