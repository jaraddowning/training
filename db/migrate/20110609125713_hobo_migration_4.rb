class HoboMigration4 < ActiveRecord::Migration
  def self.up
    add_column :training_events, :length, :integer
  end

  def self.down
    remove_column :training_events, :length
  end
end
