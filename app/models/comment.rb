class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :comment_content, presence: false, length: { minimum: 2 }
end
