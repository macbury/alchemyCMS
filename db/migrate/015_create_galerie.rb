class CreateGalerie < ActiveRecord::Migration
  def self.up
    create_table :galerie do |t|
      t.string :nazwa
      t.string :katalog

      t.timestamps
    end
    Link.create :nazwa => "Galerie", :hyperlink => "/galeria", :order => 1
  end

  def self.down
    drop_table :galerie
  end
end
