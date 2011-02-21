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

ActiveRecord::Schema.define(:version => 20110221092912) do

  create_table "bdrb_job_queues", :force => true do |t|
    t.text     "args"
    t.string   "worker_name"
    t.string   "worker_method"
    t.string   "job_key"
    t.integer  "taken"
    t.integer  "finished"
    t.integer  "timeout"
    t.integer  "priority"
    t.datetime "submitted_at"
    t.datetime "started_at"
    t.datetime "finished_at"
    t.datetime "archived_at"
    t.string   "tag"
    t.string   "submitter_info"
    t.string   "runner_info"
    t.string   "worker_key"
    t.datetime "scheduled_at"
  end

  create_table "stops", :force => true do |t|
    t.float    "latitude"
    t.float    "longitude"
    t.string   "tsndescription"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vehicles", :force => true do |t|
    t.float    "latitude"
    t.float    "longitude"
    t.string   "service_description"
    t.string   "organisation"
    t.string   "trip_status"
    t.integer  "route_direction"
    t.integer  "route_variant"
    t.integer  "route_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "vehicles", ["latitude"], :name => "index_vehicles_on_latitude"
  add_index "vehicles", ["longitude"], :name => "index_vehicles_on_longitude"

end
