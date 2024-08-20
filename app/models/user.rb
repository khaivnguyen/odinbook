class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_many :follow_requests_as_follower, class_name: 'FollowRequest', foreign_key: 'follower_id'
  has_many :follow_requests_as_followee, class_name: 'FollowRequest', foreign_key: 'followee_id'
  has_many :followers, through: :follow_requests_as_followee, source: :follower
  has_many :following, through: :follow_requests_as_follower, source: :followee
end
