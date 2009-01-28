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

ActiveRecord::Schema.define(:version => 20090128172703) do

  create_table "amazon_items", :force => true do |t|
    t.string   "asin"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
  end

  add_index "amazon_items", ["asin"], :name => "index_amazon_items_on_asin"

  create_table "areas", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "assigned_areas", :force => true do |t|
    t.integer  "owner_id"
    t.string   "owner_type"
    t.integer  "area_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "feed_items", :force => true do |t|
    t.integer  "feed_id"
    t.string   "title"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "content"
    t.datetime "published_at"
    t.string   "number"
    t.string   "volume"
  end

  add_index "feed_items", ["content"], :name => "index_feed_items_on_content"
  add_index "feed_items", ["title"], :name => "index_feed_items_on_title"

  create_table "feeds", :force => true do |t|
    t.string   "title"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recommendations", :force => true do |t|
    t.integer  "user_id"
    t.integer  "recommendable_id"
    t.string   "recommendable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "recommendations", ["recommendable_id"], :name => "index_recommendations_on_recommendable_id"
  add_index "recommendations", ["recommendable_type"], :name => "index_recommendations_on_recommendable_type"
  add_index "recommendations", ["user_id"], :name => "index_recommendations_on_user_id"

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type"], :name => "index_taggings_on_taggable_id_and_taggable_type"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "users", :force => true do |t|
    t.string   "login",                        :limit => 40
    t.string   "name",                         :limit => 100, :default => ""
    t.string   "email",                        :limit => 100
    t.string   "crypted_password",             :limit => 40
    t.string   "salt",                         :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",               :limit => 40
    t.datetime "remember_token_expires_at"
    t.boolean  "admin",                                       :default => false
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "birthday"
    t.string   "gender"
    t.string   "occupation"
    t.datetime "recommendations_generated_at"
  end

  add_index "users", ["login"], :name => "index_users_on_login", :unique => true
  add_index "users", ["recommendations_generated_at"], :name => "index_users_on_recommendations_generated_at"

end
