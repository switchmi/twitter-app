class Hashtag < ApplicationRecord
  belongs_to :user
  has_many :tweet_tags
end
