class AddIndexesToFeedItems < ActiveRecord::Migration
  def self.up
    add_index :feed_items, :title
    add_index :feed_items, :content
  end

  def self.down
    remove_index :feed_items, :title
    remove_index :feed_items, :content
  end
end
