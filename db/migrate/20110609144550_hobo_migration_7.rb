class HoboMigration7 < ActiveRecord::Migration
  def self.up
    rename_column :training_events, :length, :value
  end

  def self.down
    rename_column :training_events, :value, :length
  end
end
