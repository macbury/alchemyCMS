class DodajUzytkownikRoot < ActiveRecord::Migration
  def self.up
    u = Uzytkownik.new
    u.login = "root"
    u.password = "haslo"
    u.password_confirmation = "haslo"
    u.uprawnienia = K_SUPER_ADMIN
    u.save
  end

  def self.down
  end
end
