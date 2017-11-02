class TweetTag < ApplicationRecord
  has_many :users
  has_many :tags
end
