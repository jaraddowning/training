class HoboMigration3 < ActiveRecord::Migration
  def self.up
    add_column :users, :facilitator, :boolean, :default => false

    add_column :training_events, :location, :string
    add_column :training_events, :training_type_id, :integer

    add_index :training_events, [:training_type_id]
  end

  def self.down
    remove_column :users, :facilitator

    remove_column :training_events, :location
    remove_column :training_events, :training_type_id

    remove_index :training_events, :name => :index_training_events_on_training_type_id rescue ActiveRecord::StatementInvalid
  end
end
