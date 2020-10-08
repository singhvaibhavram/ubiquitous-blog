class Article < ActiveRecord::Base
  # Article Title Validation
  validates :title, presence: true,
             length: {minimum: 3, maximum: 50}

# Article Description Validation
  validates :description, presence: true,
             length: {minimum: 10}
end
