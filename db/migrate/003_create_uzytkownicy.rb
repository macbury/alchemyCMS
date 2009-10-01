class CreateUzytkownicy < ActiveRecord::Migration
  def self.up
    create_table "uzytkownicy", :force => true do |t|
      t.string :login
      t.string :crypted_password,         :limit => 40
      t.string :salt,                     :limit => 40
      t.datetime :created_at
      t.datetime :updated_at
      t.string :remember_token
      t.datetime :remember_token_expires_at
      t.integer :uprawnienia, :default => 0
    end
  end

  def self.down
    drop_table "uzytkownicy"
  end
end
