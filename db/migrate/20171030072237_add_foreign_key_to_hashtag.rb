class AddForeignKeyToHashtag < ActiveRecord::Migration[5.1]
  def change
    add_reference :hashtags, :user, index: true 
  end
end
