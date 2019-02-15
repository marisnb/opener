class Comment < ApplicationRecord
  enum tag: [:Like,:Comment]
  belongs_to :user
  belongs_to :article
end
