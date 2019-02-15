class User < ApplicationRecord

  has_many :articles

  has_many :bookmarks
  has_many :bookmarked_articles, :through => :bookmarks, source: :article

  has_many :comments
  has_many :commented_articles, :through => :comments, source: :article

  has_secure_password
  validates :user_name, :length=> { minimum: 2 }, :presence=> true
  validates :password, :length=> {minimum: 2}, :presence=> true

  has_many :active_relationships, class_name:  "Relationship",
           foreign_key: "follower_id",
           dependent:   :destroy
  has_many :following, through: :active_relationships, source: :followed

  has_many :passive_relationships, class_name:  "Relationship",
           foreign_key: "followed_id",
           dependent:   :destroy
  has_many :followers, through: :passive_relationships, source: :follower

  def follow(other_user)
    following << other_user
  end

  def unfollow(other_user)
    following.delete(other_user)
  end

  def following?(other_user)
    following.include?(other_user)
  end
end
