class HoboMigration9 < ActiveRecord::Migration
  def self.up
    add_column :training_types, :about, :text
  end

  def self.down
    remove_column :training_types, :about
  end
end
