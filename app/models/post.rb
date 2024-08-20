class Post < ApplicationRecord
  belongs_to :user

  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :body, presence: true

  def liked_by?(user)
    likes.exists?(user: user)
  end
end
