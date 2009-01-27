class CreateIndexOnAsin < ActiveRecord::Migration
  def self.up
    add_index :amazon_items, :asin
  end

  def self.down
    remove_index :amazon_items, :asin
  end
end
