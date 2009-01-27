class CreateRecommendations < ActiveRecord::Migration
  def self.up
    create_table :recommendations do |t|
      t.integer :user_id
      t.integer :recommendable_id
      t.string  :recommendable_type
      t.timestamps
    end
  end

  def self.down
    drop_table :recommendations
  end
end
