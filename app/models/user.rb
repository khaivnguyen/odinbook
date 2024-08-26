class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :profile_photo

  has_many :posts, dependent: :destroy

  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post

  has_many :comments, dependent: :destroy

  has_many :follow_requests_as_follower, class_name: 'FollowRequest', foreign_key: 'follower_id'
  has_many :follow_requests_as_followee, class_name: 'FollowRequest', foreign_key: 'followee_id'
  has_many :followers, through: :follow_requests_as_followee, source: :follower
  has_many :followings, through: :follow_requests_as_follower, source: :followee

  after_create :send_welcome_email
  def send_welcome_email
    UserMailer.welcome_email(self).deliver_now
  end
end
