class HoboMigration5 < ActiveRecord::Migration
  def self.up
    rename_column :users, :facilitator, :trainer
  end

  def self.down
    rename_column :users, :trainer, :facilitator
  end
end
