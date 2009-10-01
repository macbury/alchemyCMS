class CreateAdminWydarzenia < ActiveRecord::Migration
  def self.up
    create_table :wydarzenia do |t|
      t.string :tytul
      t.text :tresc
      t.references :uzytkownik
      t.timestamps
    end
  end

  def self.down
    drop_table :wydarzenia
  end
end
