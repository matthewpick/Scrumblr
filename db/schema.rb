# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20141126220638) do

  create_table "invites_projects", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "project_id"
  end

  create_table "projects", :force => true do |t|
    t.string   "project_name"
    t.text     "project_description"
    t.string   "project_github"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "projects_users", :id => false, :force => true do |t|
    t.integer "project_id"
    t.integer "user_id"
  end

  create_table "sprints", :force => true do |t|
    t.date    "sprint_start_date"
    t.date    "sprint_end_date"
    t.integer "project_id"
  end

  create_table "sprints_stories", :id => false, :force => true do |t|
    t.integer "sprint_id"
    t.integer "story_id"
  end

  create_table "stories", :force => true do |t|
    t.string  "story_name"
    t.text    "story_description"
    t.integer "story_points"
    t.string  "story_status"
    t.integer "project_id"
  end

  create_table "stories_users", :id => false, :force => true do |t|
    t.integer "story_id"
    t.integer "user_id"
  end

  create_table "tasks", :force => true do |t|
    t.string   "title"
    t.integer  "points"
    t.boolean  "needs_discussion"
    t.text     "description"
    t.string   "status"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "story_id"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "provider"
    t.string   "uid"
    t.string   "email"
    t.string   "image_url"
    t.string   "github_url"
    t.string   "session_token"
    t.integer  "user_velocity"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

end
