class HoboMigration13 < ActiveRecord::Migration
  def self.up
    create_table :my_trainings do |t|
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :my_trainings
  end
end
