class ModyfikujKomentarze < ActiveRecord::Migration
  def self.up
    remove_column :komentarze, :uzytkownik_id
    add_column :komentarze, :nazwisko, :string
    add_column :komentarze, :gg, :integer
    add_column :komentarze, :tlen, :string
    add_column :komentarze, :skype, :string
  end

  def self.down
  end
end
