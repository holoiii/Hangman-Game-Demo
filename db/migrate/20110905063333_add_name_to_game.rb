class AddNameToGame < ActiveRecord::Migration
  def self.up
    add_column :games, :name, :string
  end

  def self.down
    remove_column :games, :name
  end
end
