class HoboMigration6 < ActiveRecord::Migration
  def self.up
    create_table :user_trainings do |t|
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :user_id
      t.integer  :training_event_id
    end
    add_index :user_trainings, [:user_id]
    add_index :user_trainings, [:training_event_id]
  end

  def self.down
    drop_table :user_trainings
  end
end
