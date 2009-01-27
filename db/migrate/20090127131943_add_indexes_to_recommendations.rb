class AddIndexesToRecommendations < ActiveRecord::Migration
  def self.up
    add_index :recommendations, :recommendable_id
    add_index :recommendations, :recommendable_type
  end

  def self.down
    remove_index :recommendations, :recommendable_id
    remove_index :recommendations, :recommendable_type
  end
end
