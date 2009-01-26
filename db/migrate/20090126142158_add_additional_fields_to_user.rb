class AddAdditionalFieldsToUser < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.datetime :birthday
      t.string :gender
      t.string :occupation
    end
  end

  def self.down
    change_table :users do |t|
      t.remove :first_name
      t.remove :last_name
      t.remove :birthday
      t.remove :gender
      t.remove :occupation
    end
  end
end
