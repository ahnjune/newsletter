class ChangeAmazonTitleIdToAsin < ActiveRecord::Migration
  def self.up
    rename_column :amazon_items, :amazon_title_id, :asin
  end

  def self.down
    rename_column :amazon_items, :asin, :amazon_title_id
  end
end
