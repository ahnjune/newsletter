class AddTitleToAmazonItem < ActiveRecord::Migration
  def self.up
    add_column :amazon_items, :title, :string
  end

  def self.down
    remove_column :amazon_items, :title
  end
end
