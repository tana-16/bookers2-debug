class Book < ApplicationRecord
	belongs_to :user
	has_many :likes
  has_many :liked_users, through: :likes, source: :user

	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 200}
end
