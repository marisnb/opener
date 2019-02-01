class Article < ApplicationRecord
  scope :without_user, ->(user) { where.not(user_id: user.id) }
  belongs_to :user


  has_many :bookmarks
  has_many :bookmarked_by, :through => :bookmarks, source: :user
end
