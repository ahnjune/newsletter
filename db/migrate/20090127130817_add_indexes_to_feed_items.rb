class AddIndexesToFeedItems < ActiveRecord::Migration
  def self.up
    add_index :feed_items, :title
  end

  def self.down
    remove_index :feed_items, :title
  end
end
