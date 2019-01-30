class User < ApplicationRecord
  has_many :articles
  has_secure_password
  validates :user_name, :length=> { minimum: 2 }, :presence=> true
end
