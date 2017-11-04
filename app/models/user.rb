class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :full_name, presence: true

  has_many :tweets
  has_many :hashtags

  has_many :follower_users, class_name: 'Following', foreign_key: :followee_id
  has_many :followers, through: :follower_users

  has_many :followee_users, class_name: 'Following', foreign_key: :follower_id
  has_many :followees, through: :followee_users

  def follow(other_user)
    followees << other_user
  end

  def unfollow(other_user)
    followees.delete(other_user)
  end

  def following?(other_user)
    followees.include?(other_user)
  end

end
