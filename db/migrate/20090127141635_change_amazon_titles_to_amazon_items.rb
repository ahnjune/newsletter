class ChangeAmazonTitlesToAmazonItems < ActiveRecord::Migration
  def self.up
    rename_table :amazon_titles, :amazon_items
  end

  def self.down
    rename_table :amazon_items, :amazon_titles
  end
end
