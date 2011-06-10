# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110610144814) do

  create_table "my_trainings", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "req_classes", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "training_events", :force => true do |t|
    t.string   "name"
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "location"
    t.integer  "training_type_id"
  end

  add_index "training_events", ["training_type_id"], :name => "index_training_events_on_training_type_id"

  create_table "training_facilitators", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "training_event_id"
  end

  add_index "training_facilitators", ["training_event_id"], :name => "index_training_facilitators_on_training_event_id"
  add_index "training_facilitators", ["user_id"], :name => "index_training_facilitators_on_user_id"

  create_table "training_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "about"
    t.integer  "req_class_id"
  end

  add_index "training_types", ["req_class_id"], :name => "index_training_types_on_req_class_id"

  create_table "user_trainings", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "training_event_id"
  end

  add_index "user_trainings", ["training_event_id"], :name => "index_user_trainings_on_training_event_id"
  add_index "user_trainings", ["user_id"], :name => "index_user_trainings_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.string   "email_address"
    t.boolean  "administrator",                           :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state",                                   :default => "invited"
    t.datetime "key_timestamp"
    t.string   "name"
    t.string   "last_name"
    t.string   "username"
    t.boolean  "trainer",                                 :default => false
  end

  add_index "users", ["state"], :name => "index_users_on_state"

end
