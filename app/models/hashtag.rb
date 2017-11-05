class Hashtag < ApplicationRecord
  belongs_to :user
  has_many :tweet_tags
  has_many :tweets, through: :tweet_tags
  validates :name, presence: true
  validates :user_id, presence: true
end
