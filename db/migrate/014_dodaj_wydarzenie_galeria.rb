class DodajWydarzenieGaleria < ActiveRecord::Migration
  def self.up
    add_column :wydarzenia, :galeria, :string
  end

  def self.down
  end
end
