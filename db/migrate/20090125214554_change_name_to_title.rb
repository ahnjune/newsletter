class ChangeNameToTitle < ActiveRecord::Migration
  def self.up
    rename_column :feeds, :name, :title
  end

  def self.down
    rename_column :feeds, :title, :name
  end
end
