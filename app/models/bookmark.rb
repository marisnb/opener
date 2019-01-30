class Bookmark < ApplicationRecord
  belongs_to :users
  belongs_to :articles
end
