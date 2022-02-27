# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 0) do

  create_table "banner", id: :integer, charset: "utf8mb3", collation: "utf8_unicode_ci", options: "ENGINE=MyISAM", force: :cascade do |t|
    t.integer "page_id", null: false, comment: "0 = Nuur huudas, -1 = Ajliin bair, other = page"
    t.string "name", null: false
    t.string "name_en", null: false
    t.string "path", null: false
    t.string "mime_type", limit: 200, null: false
    t.string "path_en", null: false
    t.string "link", null: false
    t.boolean "blank_window", default: true, null: false
    t.integer "position", limit: 1, null: false, comment: "1-huudasnii zuun tald, 2-huudasnii baruun tald"
    t.boolean "is_recursive", null: false
    t.date "start_date", null: false
    t.date "end_date", null: false
    t.string "width", null: false
    t.string "height", null: false
    t.integer "sort", null: false
    t.integer "click_count", null: false
    t.integer "is_active", limit: 1, default: 0, null: false
    t.text "description", null: false
    t.text "description_en", null: false
    t.integer "second", default: 4000, null: false
    t.integer "is_shadow", null: false
    t.string "button_text", null: false
    t.timestamp "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.timestamp "updated_at", null: false
    t.integer "category_id", null: false
    t.index ["page_id"], name: "page_id"
  end

  create_table "banner_location", id: :integer, charset: "utf8mb3", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.string "location", limit: 250, null: false
    t.string "size", limit: 200, null: false
    t.integer "width", null: false
    t.integer "height", null: false
    t.string "price", limit: 200, null: false
    t.string "file_type", limit: 250, null: false
    t.integer "changes", null: false
    t.timestamp "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.timestamp "updated_at", null: false
  end

  create_table "cache", id: false, charset: "utf8mb3", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.string "key", null: false
    t.text "value", null: false
    t.integer "expiration", null: false
    t.index ["key"], name: "cache_key_unique", unique: true
  end

  create_table "category", charset: "utf8mb3", force: :cascade do |t|
    t.string "name", null: false
    t.string "seo_title", limit: 60, null: false
    t.string "seo_url", null: false
    t.string "seo_description", limit: 160, null: false
    t.string "logo"
    t.boolean "is_visible", default: false, null: false
    t.integer "homepage_visible", limit: 1, default: 0, null: false
    t.boolean "is_featured", default: false, null: false
    t.bigint "rank", default: 0, null: false
    t.bigint "parent_id"
    t.integer "banner_id", null: false
    t.bigint "lft", default: 0, null: false
    t.bigint "rgt", default: 0, null: false
    t.bigint "level", default: 0, null: false
    t.text "root_css", null: false
    t.string "root_color", null: false
    t.integer "hompage_col_no", limit: 1, null: false, comment: "1-5 dotor bn"
    t.integer "banner2_id", default: 0, null: false
    t.integer "banner3_id", null: false
    t.string "link", null: false, comment: "hervee category uur tiish usreh bol link oruulna"
    t.integer "for_title", limit: 1, default: 0, null: false
    t.integer "for_url", limit: 1, default: 0, null: false
    t.integer "home_page_rank", limit: 1, default: 0, null: false
    t.index ["lft"], name: "lft"
    t.index ["parent_id"], name: "parent_id_idx"
    t.index ["rgt"], name: "rgt"
  end

  create_table "category_attribute", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "category_id", null: false
    t.integer "attribute_id", null: false
    t.index ["attribute_id"], name: "attribute_id"
    t.index ["category_id"], name: "category_id"
  end

  create_table "category_banner", id: :integer, charset: "utf8mb3", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.integer "category_id", null: false
    t.integer "banner_id", null: false
    t.integer "banner2_id", null: false
    t.integer "banner3_id", null: false
  end

  create_table "category_stats", charset: "utf8mb3", collation: "utf8_unicode_ci", comment: "category handaltiin tooluur", force: :cascade do |t|
    t.integer "category_id", null: false
    t.string "category_name", null: false
    t.bigint "count", null: false
    t.date "created_at", null: false
  end

  create_table "cover_image_type", id: :integer, charset: "utf8mb3", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.integer "cover_id", null: false
    t.integer "height", null: false
    t.integer "width", null: false
    t.integer "position", limit: 1, null: false
  end

  create_table "groups", id: { type: :integer, unsigned: true }, charset: "utf8mb3", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.string "name", null: false
    t.text "permissions"
    t.timestamp "created_at", null: false
    t.timestamp "updated_at", null: false
    t.index ["name"], name: "groups_name_unique", unique: true
  end

  create_table "image", charset: "utf8mb3", force: :cascade do |t|
    t.string "filename", null: false
    t.string "hashcode", limit: 42, null: false
    t.bigint "product_id", null: false
    t.index ["product_id"], name: "product_id_idx"
  end

  create_table "industry", id: :integer, charset: "latin1", force: :cascade do |t|
    t.string "name", limit: 200, null: false, collation: "utf8mb4_unicode_ci"
    t.string "desc", limit: 200, null: false
  end

  create_table "location", charset: "utf8mb3", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.integer "parent_id", null: false
    t.string "name", null: false
    t.integer "level", null: false
    t.integer "sort", default: 0, null: false
  end

  create_table "order_items", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "payment_order_id", null: false
    t.integer "product_id", null: false
    t.integer "amount", null: false
    t.integer "price", null: false
    t.integer "is_coupon", limit: 1, default: 0, null: false
  end

  create_table "pages", id: { type: :integer, unsigned: true }, charset: "utf8mb3", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.integer "type", null: false
    t.integer "status", null: false
    t.integer "page_id", null: false
    t.string "image", null: false
    t.string "slug", null: false
    t.string "title", null: false
    t.string "description", limit: 1000, null: false
    t.text "body"
    t.string "author", null: false
    t.boolean "is_header", default: false, null: false
    t.boolean "is_footer", default: false, null: false
    t.integer "is_featured", limit: 1, default: 0, null: false
    t.integer "is_active", limit: 1, default: 1, null: false
    t.string "youtube_link", null: false
    t.integer "user_id", null: false
    t.integer "view_count", null: false
    t.integer "is_uploads", limit: 1, default: 0, null: false
    t.integer "is_temp", limit: 1, default: 0, null: false
    t.timestamp "created_at", null: false
    t.timestamp "updated_at", null: false
    t.integer "albom_id", null: false
    t.boolean "is_homepopup", default: false, null: false
  end

  create_table "payment_order", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "status", limit: 20, null: false
    t.integer "type_order", limit: 1, default: 0, null: false, comment: "0 - featured product, 1 - profile,"
    t.integer "user_id", null: false
    t.string "order_code", limit: 12, null: false
    t.datetime "created_at", null: false
    t.integer "nb_item", null: false
    t.integer "total", null: false
    t.integer "is_order", limit: 1, null: false
    t.string "payment_type", null: false
  end

  create_table "prices", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "category_id", null: false
    t.integer "price", null: false
  end

  create_table "product", charset: "utf8mb3", force: :cascade do |t|
    t.string "name", null: false
    t.string "name_more", null: false
    t.text "description", size: :long, null: false
    t.string "password", limit: 32, null: false
    t.float "price", default: 0.0, null: false
    t.integer "price_type", limit: 1, default: 0, null: false
    t.string "contact", null: false
    t.integer "location_id", null: false
    t.integer "shop_id", null: false
    t.integer "rate_score", null: false
    t.string "latlng", null: false
    t.boolean "is_featured", default: false, null: false
    t.integer "is_coupon", limit: 1, default: 0, null: false
    t.integer "coupon_price", default: 0, null: false
    t.integer "coupon_percent", default: 0, null: false
    t.datetime "featured_start_date"
    t.datetime "featured_due_date"
    t.bigint "category_id", null: false
    t.string "image_filename"
    t.text "attribute_value_ids", null: false
    t.string "cids"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ip_address", null: false
    t.integer "is_active", limit: 1, null: false
    t.integer "price_sale", null: false
    t.integer "delivery", null: false
    t.string "video", null: false
    t.integer "nb_totalvote", default: 0, null: false
    t.integer "nb_vote", default: 1, null: false
    t.integer "view_count", default: 0, null: false
    t.string "is_stock_str", null: false
    t.text "search_text", null: false
    t.string "changes", null: false
    t.integer "is_leasing", limit: 1, null: false
    t.integer "owner_type", limit: 1, null: false
    t.integer "auto_renew_time", default: 0, null: false
    t.integer "likes", default: 0, null: false
    t.integer "shop_category_id"
    t.string "brand", limit: 200, null: false
    t.string "product_size", limit: 100, null: false
    t.integer "product_status", default: 1, null: false
    t.date "sold_date"
    t.index ["category_id"], name: "category_id_idx"
  end

  create_table "product_comment", charset: "utf8mb3", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.integer "product_id", null: false
    t.integer "user_id", null: false
    t.integer "parent_id", default: 0, null: false
    t.integer "level", default: 0
    t.string "username"
    t.text "content", null: false
    t.string "ip_address", null: false
    t.datetime "created_at", null: false
  end

  create_table "product_report", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "product_id", null: false
    t.integer "report_id", null: false
    t.timestamp "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.timestamp "updated_at"
    t.integer "status_id", limit: 1, null: false
  end

  create_table "product_sale", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "product_id", null: false
    t.integer "sale_id", null: false
    t.integer "sale_percent", null: false
  end

  create_table "product_word", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "word_id", null: false
    t.bigint "relevance", default: 1, null: false
    t.index ["product_id", "word_id"], name: "product_id"
    t.index ["product_id"], name: "product_id_idx"
    t.index ["word_id"], name: "word_id_idx"
  end

  create_table "profile", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "phone", null: false
    t.string "address", null: false
    t.string "image", null: false
    t.string "color_code", null: false, comment: "facebook"
    t.string "cover_style", comment: "twitter"
    t.string "video", null: false
    t.string "position", null: false
    t.string "email", null: false
    t.text "about_us", null: false
    t.string "banner", null: false
    t.integer "is_company", limit: 1, null: false
    t.string "company_name", null: false
    t.integer "is_paid", limit: 1, null: false
    t.date "paid_until", null: false
    t.string "renew_products", limit: 1500, null: false
    t.string "old_products", limit: 1500, null: false
    t.text "content", null: false
    t.text "body", null: false
    t.integer "plan", default: 0, null: false
    t.datetime "plan_start_date", null: false
    t.datetime "plan_end_date", null: false
    t.integer "product_limit", default: 20, null: false
    t.string "side_banner", null: false
    t.integer "likes", null: false
    t.integer "dislikes", null: false
  end

  create_table "profile_price", id: :integer, charset: "utf8mb3", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.string "name", null: false
    t.integer "price", null: false
  end

  create_table "report_detail", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "name", null: false
  end

  create_table "search", charset: "utf8mb3", force: :cascade do |t|
    t.string "keyword", null: false
    t.datetime "created_at", null: false
  end

  create_table "search_word", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "word_id", null: false
    t.bigint "search_id", null: false
    t.datetime "created_at", null: false
    t.index ["search_id"], name: "search_id_idx"
    t.index ["word_id", "search_id"], name: "word_id"
    t.index ["word_id"], name: "word_id_idx"
  end

  create_table "settings", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "backend_title", null: false
    t.boolean "backend_category_az", null: false
    t.string "frontend_title", null: false
    t.string "frontend_description", null: false
    t.string "frontend_keywords", null: false
  end

  create_table "sf_combine", primary_key: "asset_key", id: { type: :string, limit: 40, default: "" }, charset: "utf8mb3", force: :cascade do |t|
    t.text "files", size: :long, null: false
  end

  create_table "shop_category", charset: "utf8mb3", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.integer "shop_id", null: false
    t.string "name", null: false, collation: "utf8_general_ci"
    t.integer "parent_id", null: false
    t.integer "lvl", null: false
    t.integer "rate", default: 0, null: false
  end

  create_table "shop_comment", charset: "utf8mb3", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.integer "shop_id", null: false
    t.integer "user_id", null: false
    t.integer "parent_id", default: 0, null: false
    t.integer "level", default: 0
    t.string "username"
    t.text "content", null: false
    t.string "ip_address", null: false
    t.datetime "created_at", null: false
  end

  create_table "state", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.date "created_at", null: false
    t.integer "numb", null: false
    t.integer "category_id", default: 0, null: false
  end

  create_table "throttle", id: { type: :integer, unsigned: true }, charset: "utf8mb3", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.integer "user_id", null: false, unsigned: true
    t.string "ip_address"
    t.integer "attempts", default: 0, null: false
    t.boolean "suspended", default: false, null: false
    t.boolean "banned", default: false, null: false
    t.timestamp "last_attempt_at"
    t.timestamp "suspended_at"
    t.timestamp "banned_at"
    t.index ["user_id"], name: "throttle_user_id_index"
  end

  create_table "uploads", id: :integer, charset: "utf8mb3", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.string "filename", null: false
    t.string "path", null: false
    t.integer "size", null: false
    t.string "extension", limit: 200, null: false
    t.integer "mimetype", null: false
    t.integer "user_id", null: false
    t.integer "parent_id", null: false
    t.integer "obj_id", null: false
    t.integer "obj_type", null: false
    t.timestamp "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.timestamp "updated_at", null: false
    t.index ["id"], name: "id", unique: true
  end

  create_table "user", charset: "utf8mb3", force: :cascade do |t|
    t.string "email", null: false
    t.index ["email"], name: "email", unique: true
  end

  create_table "user_category", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "category_id", null: false
    t.boolean "is_daily", default: true, null: false
    t.index ["category_id"], name: "category_id_idx"
    t.index ["user_id"], name: "user_id_idx"
  end

  create_table "user_interest", id: :integer, charset: "utf8mb3", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.integer "product_id", null: false
    t.integer "user_id", null: false
    t.integer "type", null: false
  end

  create_table "user_keyword", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "keyword", null: false
    t.boolean "is_daily", default: true, null: false
    t.bigint "nb_word", default: 0, null: false
    t.index ["user_id"], name: "user_id_idx"
  end

  create_table "user_keyword_word", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "keyword_id", null: false
    t.bigint "word_id", null: false
    t.index ["keyword_id"], name: "keyword_id_idx"
    t.index ["word_id"], name: "word_id_idx"
  end

  create_table "user_order", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "product_id", null: false
    t.string "name", limit: 50, null: false
    t.string "phone_number", limit: 30, null: false
    t.string "address", limit: 350, null: false
    t.integer "status_id", default: 0, null: false, comment: "0 = new, 1 = read"
    t.integer "quantity", null: false
    t.string "other_desc", limit: 250
    t.timestamp "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.timestamp "updated_at"
  end

  create_table "user_state", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "product_id", null: false
    t.index ["product_id"], name: "product_id"
    t.index ["user_id"], name: "user_id"
  end

  create_table "users", id: { type: :integer, unsigned: true }, charset: "utf8mb3", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.string "email", null: false
    t.string "password", null: false
    t.string "image", null: false
    t.integer "year", null: false
    t.integer "gender", limit: 1, null: false
    t.text "permissions"
    t.boolean "activated", default: false, null: false
    t.string "activation_code"
    t.timestamp "activated_at"
    t.timestamp "last_login"
    t.string "persist_code"
    t.string "reset_password_code"
    t.string "first_name"
    t.string "last_name"
    t.string "shop_name", null: false
    t.integer "is_online", limit: 1, default: 0, null: false
    t.timestamp "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.timestamp "updated_at"
    t.bigint "social_id", null: false
    t.boolean "type", null: false, comment: "1-fb, 2-tw"
    t.string "token", limit: 500, null: false
    t.string "token_secret", limit: 500, null: false
    t.integer "last_cat_id", null: false
    t.integer "is_company"
    t.string "profile_name"
    t.string "address", null: false
    t.string "phone_number", limit: 10, null: false
    t.string "booking_phone", limit: 10, null: false
    t.integer "official", limit: 1, default: 0, null: false
    t.integer "has_order", limit: 1, default: 0, null: false
    t.text "bio", size: :tiny, null: false
    t.index ["activation_code"], name: "users_activation_code_index"
    t.index ["email"], name: "users_email_unique", unique: true
    t.index ["reset_password_code"], name: "users_reset_password_code_index"
  end

  create_table "users_groups", primary_key: ["user_id", "group_id"], charset: "utf8mb3", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.integer "user_id", null: false, unsigned: true
    t.integer "group_id", null: false, unsigned: true
  end

  create_table "word", charset: "utf8mb3", force: :cascade do |t|
    t.string "name", null: false
    t.index ["name"], name: "name", unique: true
  end

end
