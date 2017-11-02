class CreateTweetTags < ActiveRecord::Migration[5.1]
  def change
    create_table :tweet_tags do |t|
      t.references :tweet, index: true
      t.references :hashtag, index: true

      t.timestamps
    end
  end
end
