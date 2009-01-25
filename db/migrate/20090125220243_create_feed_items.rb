class CreateFeedItems < ActiveRecord::Migration
  def self.up
    create_table :feed_items do |t|
      t.integer :feed_id
      t.string :title
      t.string :link
      t.timestamps
    end
  end

  def self.down
    drop_table :feed_items
  end
end
