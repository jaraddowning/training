class HoboMigration8 < ActiveRecord::Migration
  def self.up
    rename_column :users, :first_name, :name
  end

  def self.down
    rename_column :users, :name, :first_name
  end
end
