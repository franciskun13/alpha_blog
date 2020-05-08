class User < ApplicationRecord
    before_save { self.email = email.downcase }
    has_many :articles, dependent: :destroy
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    validates :username, presence: true, 
                         uniqueness: { case_sensitive: false }, 
                         length: { minimum: 3, maximum: 25 }
    validates :email, presence: true, 
                      uniqueness: { case_sensitive: false }, 
                      format: { with: VALID_EMAIL_REGEX }, 
                      length: { maximum: 105 }
    has_secure_password

end