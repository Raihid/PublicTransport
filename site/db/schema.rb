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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 0) do

  create_table "area", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_bin" do |t|
    t.string "name"
  end

  create_table "area_tickets", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_bin" do |t|
    t.integer "area"
    t.integer "ticket"
    t.index ["area"], name: "area", using: :btree
    t.index ["ticket"], name: "ticket", using: :btree
  end

  create_table "day", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_bin" do |t|
    t.integer "holiday",  limit: 1
    t.string  "name",     limit: 50
    t.date    "calendar"
  end

  create_table "departure", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_bin" do |t|
    t.time    "departure_hour"
    t.time    "arrival_hour"
    t.integer "day"
    t.integer "line"
    t.integer "vehicle"
    t.integer "driver"
    t.index ["day"], name: "day", using: :btree
    t.index ["driver"], name: "driver", using: :btree
    t.index ["line"], name: "line", using: :btree
    t.index ["vehicle"], name: "vehicle", using: :btree
  end

  create_table "difficulties", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_bin" do |t|
    t.integer "caller"
    t.integer "active"
    t.string  "line_number"
    t.integer "diff_type"
    t.index ["diff_type"], name: "diff_type", using: :btree
  end

  create_table "difficulty_repairman", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_bin" do |t|
    t.string "phone"
    t.string "working_hours"
  end

  create_table "difficulty_type", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_bin" do |t|
    t.string  "name"
    t.integer "repairman"
  end

  create_table "driver", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_bin" do |t|
    t.string  "name"
    t.string  "pesel"
    t.integer "user_id"
    t.index ["user_id"], name: "user_id", using: :btree
  end

  create_table "driver_permission", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_bin" do |t|
    t.integer "driver"
    t.integer "permission"
    t.index ["driver"], name: "driver", using: :btree
    t.index ["permission"], name: "permission", using: :btree
  end

  create_table "line", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_bin" do |t|
    t.string  "number"
    t.integer "first_stop"
    t.integer "last_stop"
    t.index ["first_stop"], name: "first_stop", using: :btree
    t.index ["last_stop"], name: "last_stop", using: :btree
  end

  create_table "permissions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_bin" do |t|
    t.string  "full_title"
    t.string  "required_document"
    t.integer "vehicle_variant"
    t.index ["vehicle_variant"], name: "vehicle_variant", using: :btree
  end

  create_table "privilege", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_bin" do |t|
    t.string  "name"
    t.integer "discount_percent"
    t.string  "document"
  end

  create_table "route_part", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_bin" do |t|
    t.integer "departure"
    t.time    "hour"
    t.integer "day"
    t.integer "stop"
    t.integer "stop_order"
    t.index ["day"], name: "day", using: :btree
    t.index ["departure"], name: "departure", using: :btree
    t.index ["stop"], name: "stop", using: :btree
  end

  create_table "schedule", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_bin" do |t|
    t.datetime "applies_from", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "applies_to",                                        null: false
    t.string   "comment"
  end

  create_table "stop", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_bin" do |t|
    t.string  "name"
    t.integer "geo_lat"
    t.integer "geo_lng"
    t.integer "area"
    t.index ["area"], name: "area", using: :btree
  end

  create_table "ticket_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_bin" do |t|
    t.string  "name"
    t.integer "privilege"
    t.integer "price"
    t.index ["privilege"], name: "privilege", using: :btree
  end

  create_table "tickets", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name",        limit: 100
    t.integer  "ticket_type"
    t.datetime "valid_from",              default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "valid_to",                default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "user_roles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_bin" do |t|
    t.string  "name"
    t.boolean "edit_permission"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_bin" do |t|
    t.string  "login"
    t.string  "password"
    t.string  "email"
    t.integer "role"
    t.integer "transport_points"
    t.index ["role"], name: "role", using: :btree
  end

  create_table "vehicle", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_bin" do |t|
    t.integer "variant"
    t.string  "registration_number"
    t.integer "value"
    t.integer "cond"
    t.index ["cond"], name: "cond", using: :btree
    t.index ["variant"], name: "variant", using: :btree
  end

  create_table "vehicle_breakdown", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_bin" do |t|
    t.integer "vehicle"
    t.integer "scale"
    t.string  "description"
    t.index ["scale"], name: "scale", using: :btree
    t.index ["vehicle"], name: "vehicle", using: :btree
  end

  create_table "vehicle_breakdown_scale", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_bin" do |t|
    t.integer "seriousness"
    t.string  "comments"
  end

  create_table "vehicle_condition", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_bin" do |t|
    t.string  "description"
    t.boolean "road_suitable"
  end

  create_table "vehicle_variant", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_bin" do |t|
    t.string "name"
  end

  add_foreign_key "area_tickets", "area", column: "area", name: "area_tickets_ibfk_1"
  add_foreign_key "area_tickets", "ticket_types", column: "ticket", name: "area_tickets_ibfk_2"
  add_foreign_key "departure", "day", column: "day", name: "departure_ibfk_1"
  add_foreign_key "departure", "driver", column: "driver", name: "departure_ibfk_4"
  add_foreign_key "departure", "line", column: "line", name: "departure_ibfk_2"
  add_foreign_key "departure", "vehicle", column: "vehicle", name: "departure_ibfk_3"
  add_foreign_key "difficulties", "difficulty_type", column: "diff_type", name: "difficulties_ibfk_1"
  add_foreign_key "driver", "users", name: "driver_ibfk_1"
  add_foreign_key "driver_permission", "driver", column: "driver", name: "driver_permission_ibfk_1"
  add_foreign_key "driver_permission", "permissions", column: "permission", name: "driver_permission_ibfk_2"
  add_foreign_key "line", "stop", column: "first_stop", name: "line_ibfk_1"
  add_foreign_key "line", "stop", column: "last_stop", name: "line_ibfk_2"
  add_foreign_key "permissions", "vehicle_variant", column: "vehicle_variant", name: "permissions_ibfk_1"
  add_foreign_key "route_part", "day", column: "day", name: "route_part_ibfk_2"
  add_foreign_key "route_part", "departure", column: "departure", name: "route_part_ibfk_1"
  add_foreign_key "route_part", "stop", column: "stop", name: "route_part_ibfk_3"
  add_foreign_key "stop", "area", column: "area", name: "stop_ibfk_1"
  add_foreign_key "ticket_types", "privilege", column: "privilege", name: "ticket_types_ibfk_1"
  add_foreign_key "users", "user_roles", column: "role", name: "users_ibfk_1"
  add_foreign_key "vehicle", "vehicle_condition", column: "cond", name: "vehicle_ibfk_1"
  add_foreign_key "vehicle", "vehicle_variant", column: "variant", name: "vehicle_ibfk_2"
  add_foreign_key "vehicle_breakdown", "vehicle", column: "vehicle", name: "vehicle_breakdown_ibfk_2"
  add_foreign_key "vehicle_breakdown", "vehicle_breakdown_scale", column: "scale", name: "vehicle_breakdown_ibfk_1"
end
