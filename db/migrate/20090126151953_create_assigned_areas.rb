class CreateAssignedAreas < ActiveRecord::Migration
  def self.up
    create_table :assigned_areas do |t|
      t.integer :owner_id
      t.string :owner_type
      t.integer :area_id
      t.timestamps
    end
  end

  def self.down
    drop_table :assigned_areas
  end
end
