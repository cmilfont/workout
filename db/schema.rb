# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20091229194809) do

  create_table "comments_of_exercises", :force => true do |t|
    t.text     "comment"
    t.integer  "user_id"
    t.integer  "exercise_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exercises", :force => true do |t|
    t.string   "name"
    t.integer  "types_of_exercise_id"
    t.integer  "sport_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "nokia_eventlaps", :force => true do |t|
    t.integer  "nokia_workout_id"
    t.string   "lapdistance"
    t.string   "laptime"
    t.string   "totaltime"
    t.string   "realtime"
    t.string   "distance"
    t.string   "totaldistance"
    t.string   "latitude"
    t.string   "longitude"
    t.string   "altitude"
    t.string   "speed"
    t.string   "pace"
    t.string   "fixquality"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "nokia_workouts", :force => true do |t|
    t.integer  "user_id"
    t.string   "oid"
    t.string   "version"
    t.string   "starttime"
    t.string   "stoptime"
    t.string   "realtime"
    t.string   "totaltime"
    t.string   "distance"
    t.string   "speed_average"
    t.string   "speed_max"
    t.string   "pace_average"
    t.string   "pace_max"
    t.string   "features"
    t.string   "verticalmovement_minaltitude"
    t.string   "verticalmovement_maxaltitude"
    t.string   "verticalmovement_ascent"
    t.string   "verticalmovement_descent"
    t.string   "activity_oid"
    t.string   "activity_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
  end

  create_table "open_id_authentication_associations", :force => true do |t|
    t.integer "issued"
    t.integer "lifetime"
    t.string  "handle"
    t.string  "assoc_type"
    t.binary  "server_url"
    t.binary  "secret"
  end

  create_table "open_id_authentication_nonces", :force => true do |t|
    t.integer "timestamp",  :null => false
    t.string  "server_url"
    t.string  "salt",       :null => false
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "sports", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags_of_exercises", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.integer  "exercise_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trainings", :force => true do |t|
    t.integer  "exercise_id"
    t.integer  "workout_id"
    t.datetime "start"
    t.datetime "finish"
    t.integer  "health_frequency"
    t.integer  "effort"
    t.string   "lapdistance"
    t.datetime "laptime"
    t.datetime "totaltime"
    t.string   "distance"
    t.string   "totaldistance"
    t.string   "latitude"
    t.string   "longitude"
    t.string   "altitude"
    t.string   "speed"
    t.string   "pace"
    t.decimal  "weight",           :precision => 7, :scale => 3
    t.integer  "reps"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "types_of_exercises", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.integer  "height",            :limit => 3, :precision => 3, :scale => 0
    t.string   "name"
    t.string   "login"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "email",                                                                       :null => false
    t.string   "openid_identifier"
    t.string   "persistence_token",                                                           :null => false
    t.integer  "login_count",                                                  :default => 0, :null => false
    t.datetime "last_request_at"
    t.datetime "last_login_at"
    t.datetime "current_login_at"
    t.string   "last_login_ip"
    t.string   "current_login_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["last_request_at"], :name => "index_users_on_last_request_at"
  add_index "users", ["login"], :name => "index_users_on_login"
  add_index "users", ["openid_identifier"], :name => "index_users_on_openid_identifier"
  add_index "users", ["persistence_token"], :name => "index_users_on_persistence_token"

  create_table "videos_of_exercises", :force => true do |t|
    t.string   "url"
    t.integer  "user_id"
    t.integer  "exercise_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "weight_goals", :force => true do |t|
    t.datetime "goal"
    t.decimal  "weight",     :precision => 6, :scale => 3
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "weights", :force => true do |t|
    t.integer  "user_id"
    t.decimal  "weight",     :precision => 6, :scale => 3
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "workouts", :force => true do |t|
    t.integer  "user_id"
    t.datetime "starttime"
    t.datetime "stoptime"
    t.datetime "realtime"
    t.datetime "totaltime"
    t.string   "distance"
    t.string   "speed_average"
    t.string   "speed_max"
    t.string   "pace_average"
    t.string   "pace_max"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
