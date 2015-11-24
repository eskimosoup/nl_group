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

ActiveRecord::Schema.define(version: 20151124131448) do

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

  create_table "admin_messages", force: :cascade do |t|
    t.string   "title",                     null: false
    t.text     "content",                   null: false
    t.boolean  "display",    default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "basic_informations", force: :cascade do |t|
    t.integer  "member_profile_id"
    t.string   "title",                                     null: false
    t.string   "first_name",                                null: false
    t.string   "middle_names"
    t.string   "last_name",                                 null: false
    t.string   "mobile_number",                             null: false
    t.string   "home_number"
    t.string   "email_address",                             null: false
    t.date     "using_current_name_since"
    t.boolean  "changed_name",              default: false
    t.text     "previous_names"
    t.date     "date_of_birth",                             null: false
    t.string   "national_insurance_number",                 null: false
    t.string   "where_heard"
    t.string   "referred_by"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  add_index "basic_informations", ["member_profile_id"], name: "index_basic_informations_on_member_profile_id", using: :btree

  create_table "basic_medical_histories", force: :cascade do |t|
    t.integer  "member_profile_id"
    t.text     "gp_address",                              null: false
    t.boolean  "illness_affecting_work",  default: false
    t.boolean  "illness_caused_by_work",  default: false
    t.boolean  "require_assistance",      default: false
    t.boolean  "having_treatment",        default: false
    t.text     "treatment_clarification"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  add_index "basic_medical_histories", ["member_profile_id"], name: "index_basic_medical_histories_on_member_profile_id", using: :btree

  create_table "clients", force: :cascade do |t|
    t.string   "name",                      null: false
    t.string   "logo",                      null: false
    t.string   "website"
    t.boolean  "display",    default: true
    t.integer  "position",   default: 0
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "dbs_checks", force: :cascade do |t|
    t.integer  "member_profile_id"
    t.boolean  "enhanced_dbs_completed_before",    null: false
    t.string   "previous_disclosure_number"
    t.date     "date_previous_dbs_completed"
    t.string   "company_completed_dbs_check"
    t.boolean  "unprotected_convictions",          null: false
    t.boolean  "unfiltered_convictions",           null: false
    t.boolean  "another_country_police_check",     null: false
    t.boolean  "suspended_or_under_investigation", null: false
    t.text     "additional_information"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "dbs_checks", ["member_profile_id"], name: "index_dbs_checks_on_member_profile_id", using: :btree

  create_table "emergency_contacts", force: :cascade do |t|
    t.integer  "member_profile_id"
    t.string   "full_name",         null: false
    t.string   "email_address",     null: false
    t.string   "mobile_number",     null: false
    t.string   "relationship"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "emergency_contacts", ["member_profile_id"], name: "index_emergency_contacts_on_member_profile_id", using: :btree

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

  create_table "immunisation_histories", force: :cascade do |t|
    t.integer  "member_profile_id"
    t.boolean  "had_triple_vaccination",       null: false
    t.date     "triple_vaccination_date"
    t.boolean  "had_polio_vaccination",        null: false
    t.date     "polio_vaccination_date"
    t.boolean  "had_hepatitis_b_vaccination",  null: false
    t.date     "hepatitis_b_vaccination_date"
    t.date     "hep_b_course_1_date"
    t.date     "hep_b_course_2_date"
    t.date     "hep_b_course_3_date"
    t.date     "hep_b_booster_1_date"
    t.date     "hep_b_booster_2_date"
    t.date     "hep_b_booster_3_date"
    t.boolean  "role_involves_epps",           null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "immunisation_histories", ["member_profile_id"], name: "index_immunisation_histories_on_member_profile_id", using: :btree

  create_table "job_applications", force: :cascade do |t|
    t.integer  "member_profile_id"
    t.integer  "job_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "job_applications", ["job_id"], name: "index_job_applications_on_job_id", using: :btree
  add_index "job_applications", ["member_profile_id", "job_id"], name: "index_job_applications_on_member_profile_id_and_job_id", unique: true, using: :btree
  add_index "job_applications", ["member_profile_id"], name: "index_job_applications_on_member_profile_id", using: :btree

  create_table "job_locations", force: :cascade do |t|
    t.integer  "job_id"
    t.string   "country"
    t.string   "country_code"
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

  create_table "logins", force: :cascade do |t|
    t.integer  "member_profile_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "logins", ["member_profile_id"], name: "index_logins_on_member_profile_id", using: :btree

  create_table "mandatory_training_courses", force: :cascade do |t|
    t.string   "name",                      null: false
    t.boolean  "display",    default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "member_addresses", force: :cascade do |t|
    t.integer  "member_profile_id"
    t.string   "address",                           null: false
    t.date     "lived_here_from",                   null: false
    t.date     "lived_here_to"
    t.boolean  "current",           default: false
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  add_index "member_addresses", ["member_profile_id"], name: "index_member_addresses_on_member_profile_id", using: :btree

  create_table "member_mandatory_trainings", force: :cascade do |t|
    t.integer  "member_training_id"
    t.integer  "mandatory_training_course_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "member_mandatory_trainings", ["mandatory_training_course_id"], name: "member_mandatory_training", using: :btree
  add_index "member_mandatory_trainings", ["member_training_id"], name: "index_member_mandatory_trainings_on_member_training_id", using: :btree

  create_table "member_other_training_courses", force: :cascade do |t|
    t.integer  "member_training_id"
    t.string   "title",                  null: false
    t.string   "training_provider_name", null: false
    t.date     "completed_on",           null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "member_other_training_courses", ["member_training_id"], name: "index_member_other_training_courses_on_member_training_id", using: :btree

  create_table "member_profiles", force: :cascade do |t|
    t.string   "email",                                  null: false
    t.string   "password_digest"
    t.string   "auth_token"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "active",                 default: false
    t.string   "password_set_token"
    t.integer  "team_member_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "full_name"
  end

  add_index "member_profiles", ["team_member_id"], name: "index_member_profiles_on_team_member_id", using: :btree

  create_table "member_qualifications", force: :cascade do |t|
    t.integer  "member_profile_id"
    t.string   "register"
    t.string   "registration_number"
    t.date     "expiry_date"
    t.integer  "afc_band"
    t.text     "additional_qualifications"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "member_qualifications", ["member_profile_id"], name: "index_member_qualifications_on_member_profile_id", using: :btree

  create_table "member_submissions", force: :cascade do |t|
    t.integer  "member_profile_id"
    t.boolean  "health_information_accurate", null: false
    t.boolean  "full_acknowledgement",        null: false
    t.boolean  "downloaded_handbook",         null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "member_submissions", ["member_profile_id"], name: "index_member_submissions_on_member_profile_id", using: :btree

  create_table "member_trainings", force: :cascade do |t|
    t.integer  "member_profile_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "member_trainings", ["member_profile_id"], name: "index_member_trainings_on_member_profile_id", using: :btree

  create_table "message_dismissals", force: :cascade do |t|
    t.integer  "member_profile_id", null: false
    t.integer  "admin_message_id",  null: false
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "message_dismissals", ["admin_message_id"], name: "index_message_dismissals_on_admin_message_id", using: :btree
  add_index "message_dismissals", ["member_profile_id"], name: "index_message_dismissals_on_member_profile_id", using: :btree

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

  create_table "payment_informations", force: :cascade do |t|
    t.integer  "member_profile_id"
    t.string   "payment_methodology", null: false
    t.boolean  "limit_working_week",  null: false
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "payment_informations", ["member_profile_id"], name: "index_payment_informations_on_member_profile_id", using: :btree

  create_table "qualifications", force: :cascade do |t|
    t.integer  "member_qualification_id"
    t.string   "name",                    null: false
    t.string   "grade_obtained",          null: false
    t.date     "completed_date",          null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "qualifications", ["member_qualification_id"], name: "index_qualifications_on_member_qualification_id", using: :btree

  create_table "read_messages", force: :cascade do |t|
    t.integer  "member_profile_id"
    t.integer  "admin_message_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "read_messages", ["admin_message_id"], name: "index_read_messages_on_admin_message_id", using: :btree
  add_index "read_messages", ["member_profile_id"], name: "index_read_messages_on_member_profile_id", using: :btree

  create_table "referees", force: :cascade do |t|
    t.integer  "member_profile_id"
    t.string   "name",                             null: false
    t.string   "position",                         null: false
    t.string   "contact_number",                   null: false
    t.string   "fax_number"
    t.string   "email_address",                    null: false
    t.text     "postal_address",                   null: false
    t.boolean  "contact_referee",   default: true
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "referees", ["member_profile_id"], name: "index_referees_on_member_profile_id", using: :btree

  create_table "resources", force: :cascade do |t|
    t.string   "name",                      null: false
    t.string   "file",                      null: false
    t.boolean  "display",    default: true
    t.integer  "position",   default: 0
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "team_member_teams", force: :cascade do |t|
    t.integer  "position"
    t.string   "name",                      null: false
    t.boolean  "display",    default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "team_members", force: :cascade do |t|
    t.string   "forename",                           null: false
    t.string   "surname",                            null: false
    t.string   "image"
    t.text     "profile"
    t.string   "email"
    t.string   "phone"
    t.string   "role",                               null: false
    t.boolean  "display",             default: true
    t.integer  "position",            default: 0
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "team_member_team_id"
  end

  add_index "team_members", ["team_member_team_id"], name: "index_team_members_on_team_member_team_id", using: :btree

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

  create_table "timesheets", force: :cascade do |t|
    t.integer  "member_profile_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "timesheets", ["member_profile_id"], name: "index_timesheets_on_member_profile_id", using: :btree

  create_table "tuberculosis_chicken_pox_checks", force: :cascade do |t|
    t.integer  "member_profile_id"
    t.boolean  "lived_continuously",     null: false
    t.boolean  "bcg_vaccination",        null: false
    t.date     "vaccination_date"
    t.boolean  "cough",                  null: false
    t.boolean  "weight_loss",            null: false
    t.boolean  "fever",                  null: false
    t.boolean  "had_tb",                 null: false
    t.text     "additional_information"
    t.boolean  "had_chicken_pox",        null: false
    t.date     "chicken_pox_date"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "tuberculosis_chicken_pox_checks", ["member_profile_id"], name: "index_tuberculosis_chicken_pox_checks_on_member_profile_id", using: :btree

  create_table "visited_countries", force: :cascade do |t|
    t.integer  "tuberculosis_chicken_pox_check_id"
    t.string   "name",                                        null: false
    t.integer  "duration",                                    null: false
    t.integer  "from_year",                         limit: 2, null: false
    t.integer  "to_year",                           limit: 2, null: false
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  add_index "visited_countries", ["tuberculosis_chicken_pox_check_id"], name: "index_visited_countries_on_tuberculosis_chicken_pox_check_id", using: :btree

  create_table "work_eligibilities", force: :cascade do |t|
    t.integer  "member_profile_id"
    t.string   "passport_number",                       null: false
    t.date     "expiry_date",                           null: false
    t.string   "nationality"
    t.boolean  "hold_eu_passport",       default: true
    t.string   "proof_of_right_to_work"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "work_eligibilities", ["member_profile_id"], name: "index_work_eligibilities_on_member_profile_id", using: :btree

  create_table "work_reasons", force: :cascade do |t|
    t.integer  "position"
    t.string   "title"
    t.string   "image"
    t.text     "summary"
    t.string   "colour"
    t.boolean  "display",    default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "workable_stages", force: :cascade do |t|
    t.string   "slug"
    t.string   "name",                            null: false
    t.string   "kind",                            null: false
    t.integer  "position",        default: 0
    t.boolean  "pull_candidates", default: false
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
  add_foreign_key "basic_informations", "member_profiles", on_delete: :cascade
  add_foreign_key "basic_medical_histories", "member_profiles", on_delete: :cascade
  add_foreign_key "dbs_checks", "member_profiles", on_delete: :cascade
  add_foreign_key "emergency_contacts", "member_profiles", on_delete: :cascade
  add_foreign_key "immunisation_histories", "member_profiles", on_delete: :cascade
  add_foreign_key "job_applications", "jobs", on_delete: :cascade
  add_foreign_key "job_applications", "member_profiles", on_delete: :cascade
  add_foreign_key "job_locations", "jobs", on_delete: :cascade
  add_foreign_key "logins", "member_profiles", on_delete: :cascade
  add_foreign_key "member_addresses", "member_profiles", on_delete: :cascade
  add_foreign_key "member_mandatory_trainings", "mandatory_training_courses", on_delete: :cascade
  add_foreign_key "member_mandatory_trainings", "member_trainings", on_delete: :cascade
  add_foreign_key "member_other_training_courses", "member_trainings", on_delete: :cascade
  add_foreign_key "member_profiles", "team_members", on_delete: :nullify
  add_foreign_key "member_qualifications", "member_profiles", on_delete: :cascade
  add_foreign_key "member_submissions", "member_profiles", on_delete: :cascade
  add_foreign_key "member_trainings", "member_profiles", on_delete: :cascade
  add_foreign_key "message_dismissals", "admin_messages", on_delete: :cascade
  add_foreign_key "message_dismissals", "member_profiles", on_delete: :cascade
  add_foreign_key "payment_informations", "member_profiles", on_delete: :cascade
  add_foreign_key "qualifications", "member_qualifications", on_delete: :cascade
  add_foreign_key "read_messages", "admin_messages", on_delete: :cascade
  add_foreign_key "read_messages", "member_profiles", on_delete: :cascade
  add_foreign_key "referees", "member_profiles", on_delete: :cascade
  add_foreign_key "team_members", "team_member_teams"
  add_foreign_key "timesheets", "member_profiles", on_delete: :cascade
  add_foreign_key "tuberculosis_chicken_pox_checks", "member_profiles", on_delete: :cascade
  add_foreign_key "visited_countries", "tuberculosis_chicken_pox_checks", on_delete: :cascade
  add_foreign_key "work_eligibilities", "member_profiles", on_delete: :cascade
end
