class AddStatusToGame < ActiveRecord::Migration
  def self.up
    add_column :games, :status, :string
  end

  def self.down
    remove_column :games, :status
  end
end
