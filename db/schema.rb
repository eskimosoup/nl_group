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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20151021145533) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "additional_animations", force: :cascade do |t|
    t.integer  "additional_block_id"
    t.integer  "additional_title_id"
    t.integer  "additional_paragraph_id"
    t.integer  "additional_button_id"
    t.string   "animation_type"
    t.integer  "animation_delay",         default: 0
    t.boolean  "active",                  default: true
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "additional_animations", ["additional_block_id"], name: "index_additional_animations_on_additional_block_id", using: :btree
  add_index "additional_animations", ["additional_button_id"], name: "index_additional_animations_on_additional_button_id", using: :btree
  add_index "additional_animations", ["additional_paragraph_id"], name: "index_additional_animations_on_additional_paragraph_id", using: :btree
  add_index "additional_animations", ["additional_title_id"], name: "index_additional_animations_on_additional_title_id", using: :btree

  create_table "additional_blocks", force: :cascade do |t|
    t.integer  "position"
    t.string   "name"
    t.string   "classes"
    t.boolean  "display",           default: true
    t.integer  "additional_row_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "style"
    t.boolean  "has_title",         default: true
    t.boolean  "has_paragraph",     default: true
    t.boolean  "has_buttons",       default: false
  end

  add_index "additional_blocks", ["additional_row_id"], name: "index_additional_blocks_on_additional_row_id", using: :btree

  create_table "additional_buttons", force: :cascade do |t|
    t.integer  "additional_block_id"
    t.string   "button_text"
    t.string   "button_link"
    t.boolean  "display",             default: true
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "position"
    t.string   "classes"
  end

  add_index "additional_buttons", ["additional_block_id"], name: "index_additional_buttons_on_additional_block_id", using: :btree

  create_table "additional_paragraphs", force: :cascade do |t|
    t.integer  "additional_block_id"
    t.string   "name"
    t.text     "content"
    t.boolean  "display",             default: true
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "classes"
  end

  add_index "additional_paragraphs", ["additional_block_id"], name: "index_additional_paragraphs_on_additional_block_id", using: :btree

  create_table "additional_rows", force: :cascade do |t|
    t.integer  "position"
    t.integer  "additional_blocks_count"
    t.string   "name"
    t.integer  "maximum_content_blocks"
    t.boolean  "display",                 default: true
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "style"
  end

  create_table "additional_titles", force: :cascade do |t|
    t.integer  "additional_block_id"
    t.string   "content"
    t.boolean  "display",             default: true
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "classes"
  end

  add_index "additional_titles", ["additional_block_id"], name: "index_additional_titles_on_additional_block_id", using: :btree

  create_table "clients", force: :cascade do |t|
    t.string   "name",                      null: false
    t.string   "logo",                      null: false
    t.string   "website"
    t.boolean  "display",    default: true
    t.integer  "position",   default: 0
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "frequently_asked_questions", force: :cascade do |t|
    t.string   "question",                  null: false
    t.text     "answer",                    null: false
    t.boolean  "display",    default: true
    t.integer  "position",   default: 0
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "job_locations", force: :cascade do |t|
    t.integer  "job_id"
    t.string   "country"
    t.string   "country_coe"
    t.string   "region"
    t.string   "region_code"
    t.string   "city"
    t.string   "zip_code"
    t.boolean  "telecommuting"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "job_locations", ["job_id"], name: "index_job_locations_on_job_id", using: :btree

  create_table "jobs", force: :cascade do |t|
    t.string   "workable_id"
    t.string   "full_title"
    t.string   "shortcode"
    t.string   "code"
    t.string   "state"
    t.string   "department"
    t.string   "url"
    t.string   "application_url"
    t.string   "shortlink"
    t.datetime "workable_created_at"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "landing_pages", force: :cascade do |t|
    t.string   "name",          null: false
    t.string   "slug"
    t.string   "suggested_url"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "optimadmin_administrators", force: :cascade do |t|
    t.string   "username",               null: false
    t.string   "email",                  null: false
    t.string   "role",                   null: false
    t.string   "auth_token"
    t.string   "password_digest",        null: false
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "optimadmin_administrators", ["auth_token"], name: "index_optimadmin_administrators_on_auth_token", using: :btree
  add_index "optimadmin_administrators", ["email"], name: "index_optimadmin_administrators_on_email", using: :btree
  add_index "optimadmin_administrators", ["username"], name: "index_optimadmin_administrators_on_username", using: :btree

  create_table "optimadmin_documents", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "document",    null: false
    t.string   "module_name"
    t.integer  "module_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "optimadmin_external_links", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "optimadmin_images", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "image",       null: false
    t.string   "module_name"
    t.integer  "module_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "optimadmin_links", force: :cascade do |t|
    t.string   "menu_resource_type"
    t.integer  "menu_resource_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "optimadmin_menu_item_hierarchies", id: false, force: :cascade do |t|
    t.integer "ancestor_id",   null: false
    t.integer "descendant_id", null: false
    t.integer "generations",   null: false
  end

  add_index "optimadmin_menu_item_hierarchies", ["ancestor_id", "descendant_id", "generations"], name: "menu_item_anc_desc_idx", unique: true, using: :btree
  add_index "optimadmin_menu_item_hierarchies", ["descendant_id"], name: "menu_item_desc_idx", using: :btree

  create_table "optimadmin_menu_items", force: :cascade do |t|
    t.string   "menu_name",       limit: 100
    t.string   "name",            limit: 100
    t.integer  "parent_id"
    t.boolean  "deletable",                   default: true
    t.boolean  "new_window",                  default: false
    t.string   "title_attribute", limit: 100
    t.integer  "position",                    default: 0
    t.integer  "link_id"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  add_index "optimadmin_menu_items", ["link_id"], name: "index_optimadmin_menu_items_on_link_id", using: :btree

  create_table "optimadmin_module_pages", force: :cascade do |t|
    t.string   "name"
    t.string   "route"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "optimadmin_site_settings", force: :cascade do |t|
    t.string "key"
    t.string "value"
    t.string "environment"
  end

  create_table "pages", force: :cascade do |t|
    t.string   "title",                        null: false
    t.string   "slug"
    t.string   "suggested_url"
    t.string   "image"
    t.string   "style",                        null: false
    t.string   "layout",                       null: false
    t.boolean  "display",       default: true
    t.text     "content",                      null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "resources", force: :cascade do |t|
    t.string   "name",                      null: false
    t.string   "file",                      null: false
    t.boolean  "display",    default: true
    t.integer  "position",   default: 0
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "team_members", force: :cascade do |t|
    t.string   "forename",                  null: false
    t.string   "surname",                   null: false
    t.string   "image"
    t.text     "profile"
    t.string   "email"
    t.string   "phone"
    t.string   "role",                      null: false
    t.boolean  "display",    default: true
    t.integer  "position",   default: 0
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "testimonials", force: :cascade do |t|
    t.string   "forename",                        null: false
    t.string   "surname",                         null: false
    t.string   "role",                            null: false
    t.string   "image"
    t.text     "content",                         null: false
    t.text     "video_embed_code"
    t.boolean  "display",          default: true
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_foreign_key "additional_animations", "additional_blocks"
  add_foreign_key "additional_animations", "additional_buttons"
  add_foreign_key "additional_animations", "additional_paragraphs"
  add_foreign_key "additional_animations", "additional_titles"
  add_foreign_key "additional_blocks", "additional_rows"
  add_foreign_key "additional_buttons", "additional_blocks"
  add_foreign_key "additional_paragraphs", "additional_blocks"
  add_foreign_key "additional_titles", "additional_blocks"
  add_foreign_key "job_locations", "jobs", on_delete: :cascade
end
