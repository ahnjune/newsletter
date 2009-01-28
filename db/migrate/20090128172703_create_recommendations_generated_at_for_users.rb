class CreateRecommendationsGeneratedAtForUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :recommendations_generated_at, :datetime
    add_index :users, :recommendations_generated_at
  end

  def self.down
    remove_column :users, :recommendations_generated_at
  end
end
