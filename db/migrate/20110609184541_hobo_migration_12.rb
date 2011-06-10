class HoboMigration12 < ActiveRecord::Migration
  def self.up
    add_column :training_types, :req_class_id, :integer
    remove_column :training_types, :value

    remove_column :training_events, :req_class_id

    add_index :training_types, [:req_class_id]

    remove_index :training_events, :name => :index_training_events_on_req_class_id rescue ActiveRecord::StatementInvalid
  end

  def self.down
    remove_column :training_types, :req_class_id
    add_column :training_types, :value, :integer

    add_column :training_events, :req_class_id, :integer

    remove_index :training_types, :name => :index_training_types_on_req_class_id rescue ActiveRecord::StatementInvalid

    add_index :training_events, [:req_class_id]
  end
end
