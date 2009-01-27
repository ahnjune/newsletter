class AddNumberAndVolumeToFeedItems < ActiveRecord::Migration
  def self.up
    change_table :feed_items do |t|
      t.string :number
      t.string :volume
    end
  end

  def self.down
    change_table :feed_items do |t|
      t.remove :number
      t.remove :volume
    end
  end
end
