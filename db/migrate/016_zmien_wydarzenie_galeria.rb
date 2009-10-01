class ZmienWydarzenieGaleria < ActiveRecord::Migration
  def self.up
    rename_column :wydarzenia, :galeria, :galeria_id
    change_column :wydarzenia, :galeria_id, :integer
  end

  def self.down
  end
end
