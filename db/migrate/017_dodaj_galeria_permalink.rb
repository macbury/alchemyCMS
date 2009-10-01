class DodajGaleriaPermalink < ActiveRecord::Migration
  def self.up
    add_column :galerie, :permalink, :string
  end

  def self.down
  end
end
