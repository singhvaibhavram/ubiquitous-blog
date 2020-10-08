class User < ActiveRecord::Base
  # One to Many associations
  has_many :articles

  # Email downcase
  before_save { self.email = email.downcase }

  # Username Validation for User Creation
  validates :username, presence: true,
             uniqueness: {case_sensitive: false},
             length: {minimum: 3, maximum: 25}

 # Email validation for Email Creation
 VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
 validates :email, presence: true,
            length: {maximum: 105},
            uniqueness: {case_sensitive: false},
            format: {with: VALID_EMAIL_REGEX}
end
