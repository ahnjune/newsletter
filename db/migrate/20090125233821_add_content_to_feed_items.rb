class AddContentToFeedItems < ActiveRecord::Migration
  def self.up
    change_table :feed_items do |t|
      t.text :content
    end
  end

  def self.down
    change_table :feed_items do |t|
      t.remove :content
    end
  end
end
