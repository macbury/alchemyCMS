class ModyfiukjKomentarze2 < ActiveRecord::Migration
  def self.up
    add_column :komentarze, :uzytkownik_id, :integer
    remove_column :komentarze, :nazwisko
    remove_column :komentarze, :gg
    remove_column :komentarze, :tlen
    remove_column :komentarze, :skype
  end

  def self.down
  end
end
