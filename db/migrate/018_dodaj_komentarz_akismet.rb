class DodajKomentarzAkismet < ActiveRecord::Migration
  def self.up
    add_column :komentarze, :user_ip, :string
    add_column :komentarze, :user_agent, :string
    add_column :komentarze, :referrer, :string
    add_column :komentarze, :akceptowany, :boolean, :default => false, :null => false
    
    Komentarz.update_all('akceptowany = 1')
  end

  def self.down
  end
end
