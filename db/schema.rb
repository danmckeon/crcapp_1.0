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

ActiveRecord::Schema.define(version: 20161019222740) do

  create_table "c_clinical_trials", force: :cascade do |t|
    t.string   "org_study_id"
    t.string   "secondary_id"
    t.string   "nct_id"
    t.string   "nct_alias"
    t.string   "brief_title"
    t.string   "official_title"
    t.string   "lead_sponsor_name"
    t.string   "lead_sponsor_class"
    t.string   "brief_summary"
    t.string   "detailed_description"
    t.string   "overall_status"
    t.string   "start_date"
    t.string   "phase"
    t.string   "study_type"
    t.string   "study_design"
    t.string   "primary_outcome_measure"
    t.string   "primary_outcome_time_frame"
    t.string   "primary_outcome_safety_issue"
    t.string   "secondary_outcome_measure"
    t.string   "secondary_outcome_time_frame"
    t.string   "secondary_outcome_safety_issue"
    t.integer  "number_of_groups"
    t.integer  "enrollment_number"
    t.string   "condition"
    t.string   "arm_group_label"
    t.string   "arm_group_description"
    t.string   "eligibility"
    t.string   "sampling_method"
    t.string   "criteria"
    t.string   "gender"
    t.string   "minimum_age"
    t.string   "maximum_age"
    t.string   "healthy_volunteers"
    t.string   "location_name"
    t.string   "location_city"
    t.string   "location_state"
    t.string   "location_zip"
    t.string   "location_country"
    t.string   "results_reference_citation"
    t.integer  "results_reference_PMID"
    t.string   "verification_date"
    t.string   "lastchanged_date"
    t.string   "firstreceived_date"
    t.string   "responsible_party_type"
    t.string   "keyword"
    t.string   "is_fda_regulated"
    t.string   "has_expanded_access"
    t.string   "condition_browse_mesh_term"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "overall_official"
    t.string   "contact"
    t.string   "contact_backup"
    t.string   "overall_contact"
    t.string   "overall_contact_backup"
    t.integer  "age_minimum_int"
    t.integer  "age_maximum_int"
    t.string   "location_status"
    t.integer  "recruiting_site_count"
  end

  create_table "trial_sites", force: :cascade do |t|
    t.string   "site_name"
    t.string   "site_city"
    t.string   "site_state"
    t.integer  "site_zip"
    t.string   "site_county"
    t.string   "site_status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",             default: false
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.datetime "activated_at"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
