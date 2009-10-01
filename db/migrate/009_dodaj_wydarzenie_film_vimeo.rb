class DodajWydarzenieFilmVimeo < ActiveRecord::Migration
  def self.up
    add_column :wydarzenia, :vimeo_id, :integer
  end

  def self.down
  end
end
