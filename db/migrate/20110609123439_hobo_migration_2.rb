class HoboMigration2 < ActiveRecord::Migration
  def self.up
    create_table :training_types do |t|
      t.string   :name
      t.integer  :value
      t.datetime :created_at
      t.datetime :updated_at
    end

    create_table :training_events do |t|
      t.string   :name
      t.date     :date
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :training_types
    drop_table :training_events
  end
end
