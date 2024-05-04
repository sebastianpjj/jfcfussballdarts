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

ActiveRecord::Schema[7.0].define(version: 2024_05_03_221731) do
  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.integer "resource_id"
    t.string "author_type"
    t.integer "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "competitions", force: :cascade do |t|
    t.string "name"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer "participation_charge_cents"
    t.string "participation_charge_currency"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug", null: false
    t.index ["slug"], name: "index_competitions_on_slug"
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer "priority", default: 0, null: false
    t.integer "attempts", default: 0, null: false
    t.text "handler", null: false
    t.text "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string "locked_by"
    t.string "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "participations", force: :cascade do |t|
    t.integer "team_id"
    t.integer "competition_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.index ["competition_id"], name: "index_participations_on_competition_id"
    t.index ["team_id"], name: "index_participations_on_team_id"
  end

  create_table "payments", force: :cascade do |t|
    t.integer "participation_id"
    t.boolean "was_payed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "amount_cents", null: false
    t.string "amount_currency"
    t.index ["participation_id"], name: "index_payments_on_participation_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.integer "team_id"
    t.boolean "is_captain"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_players_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slogan"
  end

  create_table "training_session_participations", force: :cascade do |t|
    t.integer "training_session_id"
    t.integer "participation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["participation_id"], name: "index_training_session_participations_on_participation_id"
    t.index ["training_session_id"], name: "index_training_session_participations_on_training_session_id"
  end

  create_table "training_sessions", force: :cascade do |t|
    t.string "name"
    t.integer "competition_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer "participation_charge_cents"
    t.string "participation_charge_currency"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["competition_id"], name: "index_training_sessions_on_competition_id"
  end

end
