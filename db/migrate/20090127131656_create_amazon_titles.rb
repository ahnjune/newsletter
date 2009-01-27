class CreateAmazonTitles < ActiveRecord::Migration
  def self.up
    create_table :amazon_titles do |t|
      t.string :amazon_title_id
      t.timestamps
    end
  end

  def self.down
    drop_table :amazon_titles
  end
end
