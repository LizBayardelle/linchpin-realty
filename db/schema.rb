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

ActiveRecord::Schema.define(version: 2023_03_01_171953) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "affords", force: :cascade do |t|
    t.decimal "monthly", precision: 11, scale: 2
    t.decimal "insurance", precision: 11, scale: 2
    t.decimal "tax", precision: 11, scale: 2
    t.decimal "dues", precision: 11, scale: 2
    t.decimal "downpayment", precision: 11, scale: 2
    t.integer "term"
    t.decimal "interest", precision: 11, scale: 2
    t.decimal "combined_tax", precision: 11, scale: 2
    t.string "email"
    t.boolean "contact", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "blogs", id: :serial, force: :cascade do |t|
    t.string "title"
    t.string "teaser"
    t.text "body"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.string "slug"
    t.string "link_text"
    t.string "link_filename"
    t.bigint "pillars_id"
    t.boolean "optin", default: false
    t.string "optin_tags", default: "LM-blog"
    t.boolean "published", default: false
    t.datetime "published_at"
    t.bigint "resource_id"
    t.index ["pillars_id"], name: "index_blogs_on_pillars_id"
    t.index ["resource_id"], name: "index_blogs_on_resource_id"
    t.index ["slug"], name: "index_blogs_on_slug", unique: true
    t.index ["user_id"], name: "index_blogs_on_user_id"
  end

  create_table "buyers", id: :serial, force: :cascade do |t|
    t.string "buyer_name"
    t.string "phone_mobile"
    t.string "phone_home"
    t.string "phone_work"
    t.string "phone_fax"
    t.string "email"
    t.string "employer"
    t.string "search_time"
    t.string "other_agent"
    t.string "address"
    t.string "family_size"
    t.string "own_or_rent"
    t.string "current_mortgage"
    t.string "need_sell"
    t.string "lease_length"
    t.string "really_liked"
    t.string "why_not"
    t.string "move_time"
    t.string "why_move_time"
    t.string "price_range"
    t.string "qualified"
    t.string "lender"
    t.string "downpayment"
    t.string "monthly_budget"
    t.string "bedrooms"
    t.string "square_feet"
    t.string "units"
    t.string "location"
    t.string "style"
    t.string "decision"
    t.string "helper"
    t.string "requirements"
    t.string "use_as_agent"
    t.string "times"
    t.string "communication"
    t.string "best_time"
    t.string "sites"
    t.string "other_information"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "archived", default: false
    t.boolean "read", default: false
  end

  create_table "comments", id: :serial, force: :cascade do |t|
    t.text "body"
    t.integer "user_id"
    t.integer "blog_id"
    t.boolean "approved", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "read", default: false
    t.string "email"
    t.string "name"
    t.index ["blog_id"], name: "index_comments_on_blog_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "contacts", id: :serial, force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.string "email"
    t.string "preferred_contact"
    t.string "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "purpose"
    t.boolean "archived", default: false
    t.boolean "read", default: false
  end

  create_table "documents", force: :cascade do |t|
    t.string "name"
    t.text "notes"
    t.bigint "user_id"
    t.bigint "loan_id"
    t.boolean "received", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["loan_id"], name: "index_documents_on_loan_id"
    t.index ["user_id"], name: "index_documents_on_user_id"
  end

  create_table "friendly_id_slugs", id: :serial, force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "infos", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone"
    t.string "goal"
    t.string "residence_type"
    t.string "residence_use"
    t.string "timeframe"
    t.string "first_time"
    t.string "military"
    t.string "agent"
    t.integer "purchase_price"
    t.integer "downpayment"
    t.integer "credit_score"
    t.integer "late_payments"
    t.string "foreclosures"
    t.string "bankruptcy"
    t.boolean "read", default: false
    t.boolean "archived", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "intakes", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.boolean "current_own", default: false
    t.boolean "current_rent", default: false
    t.decimal "current_monthly_pay", precision: 11, scale: 2
    t.string "looking_for"
    t.string "areas"
    t.string "amenities"
    t.string "price_range"
    t.integer "bedrooms"
    t.string "reason"
    t.string "looking_time"
    t.boolean "other_agent", default: false
    t.string "other_agent_name"
    t.boolean "seen_liked", default: false
    t.string "seen_no_buy"
    t.string "when_moved"
    t.string "best_times"
    t.decimal "price_min", precision: 11, scale: 2
    t.decimal "price_max", precision: 11, scale: 2
    t.string "buying_with"
    t.decimal "downpayment", precision: 11, scale: 2
    t.string "source"
    t.string "budget_monthly"
    t.boolean "met_lender", default: false
    t.boolean "preapproved", default: false
    t.decimal "preapproved_amount", precision: 11, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_intakes_on_user_id"
  end

  create_table "listings", id: :serial, force: :cascade do |t|
    t.string "zpid"
    t.string "status"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "address"
    t.string "citystatezip"
    t.text "notes"
    t.string "slug"
    t.boolean "featured", default: false
    t.string "default_image_file_name"
    t.string "default_image_content_type"
    t.integer "default_image_file_size"
    t.datetime "default_image_updated_at"
    t.index ["slug"], name: "index_listings_on_slug", unique: true
  end

  create_table "loans", force: :cascade do |t|
    t.date "first_payment"
    t.decimal "principal", precision: 10, scale: 2
    t.decimal "interest_rate", precision: 10, scale: 3
    t.integer "term_months"
    t.boolean "active"
    t.bigint "user_id"
    t.text "admin_notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "client_email"
    t.string "program"
    t.string "client_last_name"
    t.index ["user_id"], name: "index_loans_on_user_id"
  end

  create_table "payments", force: :cascade do |t|
    t.string "due_or_paid"
    t.datetime "date"
    t.bigint "loan_id"
    t.string "paid_by"
    t.decimal "amount", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["loan_id"], name: "index_payments_on_loan_id"
  end

  create_table "pillars", id: :serial, force: :cascade do |t|
    t.string "name"
    t.boolean "buyer"
    t.boolean "seller"
    t.boolean "active", default: false
    t.boolean "menu", default: false
    t.string "snippet"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["slug"], name: "index_pillars_on_slug", unique: true
  end

  create_table "quicks", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "email"
    t.string "range"
    t.string "budget"
    t.string "location"
    t.string "bedrooms"
    t.string "bathrooms"
    t.string "footage"
    t.text "notes"
    t.boolean "responded", default: false
    t.boolean "archived", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "house", default: true
    t.boolean "read", default: false
  end

  create_table "resources", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.boolean "general", default: false
    t.boolean "buying", default: false
    t.boolean "selling", default: false
    t.boolean "loan", default: false
    t.boolean "refinance", default: false
    t.boolean "investing", default: false
    t.string "resource_type"
    t.string "link_url"
    t.boolean "active", default: true
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "primary_category"
    t.string "csv_tags"
    t.string "whatisit"
    t.index ["user_id"], name: "index_resources_on_user_id"
  end

  create_table "subscribers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.string "email"
    t.text "tags", default: [], array: true
    t.text "admin_notes"
    t.boolean "unsubscribe"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "tag_string"
    t.string "resource_id_array", default: [], array: true
  end

  create_table "taggings", id: :serial, force: :cascade do |t|
    t.integer "tag_id"
    t.integer "taggable_id"
    t.string "taggable_type"
    t.integer "tagger_id"
    t.string "tagger_type"
    t.string "context", limit: 128
    t.datetime "created_at"
    t.index ["context"], name: "index_taggings_on_context"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy"
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id"
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type"
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type"
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id"
  end

  create_table "tags", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "team_assignments", id: false, force: :cascade do |t|
    t.integer "team_id", null: false
    t.integer "client_id", null: false
  end

  create_table "updates", force: :cascade do |t|
    t.string "name"
    t.string "source_name"
    t.string "source_url"
    t.string "resource_url"
    t.string "category"
    t.datetime "date_published"
    t.boolean "display", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.boolean "admin", default: false
    t.boolean "buyer", default: false
    t.boolean "seller", default: false
    t.boolean "blog_emails", default: false
    t.string "preferred_contact"
    t.boolean "status_confirmed", default: false
    t.boolean "archived", default: false
    t.boolean "read", default: false
    t.boolean "current_client", default: false
    t.boolean "team", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "values", id: :serial, force: :cascade do |t|
    t.string "address"
    t.string "citystatezip"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "sell_timeframe"
    t.boolean "archived", default: false
    t.boolean "read", default: false
    t.string "email"
    t.index ["user_id"], name: "index_values_on_user_id"
  end

  add_foreign_key "blogs", "resources"
  add_foreign_key "blogs", "users"
  add_foreign_key "comments", "blogs"
  add_foreign_key "comments", "users"
  add_foreign_key "intakes", "users"
  add_foreign_key "payments", "loans"
  add_foreign_key "resources", "users"
  add_foreign_key "values", "users"
end
