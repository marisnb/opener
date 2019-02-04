class User < ApplicationRecord

  has_many :articles

  has_many :bookmarks
  has_many :bookmarked_articles, :through => :bookmarks, source: :article

  has_many :comments
  has_many :commented_articles, :through => :comments, source: :article

  has_secure_password
  validates :user_name, :length=> { minimum: 2 }, :presence=> true
  validates :password, :length=> {minimum: 2}, :presence=> true
end
