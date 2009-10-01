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

ActiveRecord::Schema.define(:version => 20) do

  create_table "admin_komentarze", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "filmy", :force => true do |t|
    t.string  "url"
    t.integer "wydarzenie_id"
  end

  create_table "galerie", :force => true do |t|
    t.string   "nazwa"
    t.string   "katalog"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "permalink"
  end

  create_table "komentarze", :force => true do |t|
    t.text     "tresc"
    t.integer  "dokument_id"
    t.string   "dokument_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "user_ip"
    t.string   "user_agent"
    t.string   "referrer"
    t.boolean  "akceptowany",   :default => false, :null => false
    t.integer  "uzytkownik_id"
  end

  create_table "linki", :force => true do |t|
    t.string  "nazwa"
    t.string  "hyperlink"
    t.integer "order"
  end

  create_table "strony", :force => true do |t|
    t.string   "nazwa"
    t.text     "tresc"
    t.string   "permalink"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "uzytkownicy", :force => true do |t|
    t.string   "login"
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.integer  "uprawnienia",                             :default => 0
    t.string   "nazwisko"
  end

  create_table "wydarzenia", :force => true do |t|
    t.string   "tytul"
    t.text     "tresc"
    t.integer  "uzytkownik_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "permalink"
    t.integer  "galeria_id"
  end

end
