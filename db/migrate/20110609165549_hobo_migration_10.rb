class HoboMigration10 < ActiveRecord::Migration
  def self.up
    create_table :training_facilitators do |t|
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :user_id
      t.integer  :training_event_id
    end
    add_index :training_facilitators, [:user_id]
    add_index :training_facilitators, [:training_event_id]
  end

  def self.down
    drop_table :training_facilitators
  end
end
