class CreateFilmy < ActiveRecord::Migration
  def self.up
    create_table :filmy do |t|
      t.string :url
      t.references :wydarzenie
    end
    
    remove_column :wydarzenia, :youtube_id
  end

  def self.down
    drop_table :filmy
  end
end
