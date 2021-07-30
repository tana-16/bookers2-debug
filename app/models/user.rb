class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :book
  def already_liked?(book)
    self.likes.exists?(book_id: book.id)
  end
  
  attachment :profile_image, destroy: false

  validates :introduction, presence: false, length: { maximum: 50 }
  validates :name, length: {maximum: 20, minimum: 2}, uniqueness: true
end
