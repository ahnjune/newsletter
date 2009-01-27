class AddUserIdIndexToRecommendations < ActiveRecord::Migration
  def self.up
    add_index :recommendations, :user_id
  end

  def self.down
    remove_index :recommendations, :user_id
  end
end
