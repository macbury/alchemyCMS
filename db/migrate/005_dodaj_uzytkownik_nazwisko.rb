class DodajUzytkownikNazwisko < ActiveRecord::Migration
  def self.up
    add_column :uzytkownicy, :nazwisko, :string 
  end

  def self.down
  end
end
