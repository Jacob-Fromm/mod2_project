class User < ApplicationRecord
    before_save { self.email = email.downcase}

    has_many :trips
    has_many :parks, through: :trips
    validates :name, presence: true
    validates :email, presence: true
  
    # validates email format
    validates :email, email: true
    validates :email, uniqueness: true
    # validates_confirmation_of :password
    validates :password, length: { minimum: 6}
  # validates :password, confirmation: true
  has_secure_password
end
