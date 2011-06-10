class HoboMigration11 < ActiveRecord::Migration
  def self.up
    create_table :req_classes do |t|
      t.string   :name
      t.datetime :created_at
      t.datetime :updated_at
    end

    add_column :training_events, :req_class_id, :integer
    remove_column :training_events, :value

    add_index :training_events, [:req_class_id]
  end

  def self.down
    remove_column :training_events, :req_class_id
    add_column :training_events, :value, :integer

    drop_table :req_classes

    remove_index :training_events, :name => :index_training_events_on_req_class_id rescue ActiveRecord::StatementInvalid
  end
end
