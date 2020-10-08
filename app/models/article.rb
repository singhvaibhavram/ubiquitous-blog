class Article < ActiveRecord::Base
  # User Association with articles
  belongs_to :user

  # Article Title Validation
  validates :title, presence: true,
             length: {minimum: 3, maximum: 50}

# Article Description Validation
  validates :description, presence: true,
             length: {minimum: 10}
# Prevent nil user_id so Validations
validates :user_id, presence: true
end
