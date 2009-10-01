class CreateKomentarze < ActiveRecord::Migration
  def self.up
    create_table :komentarze do |t|
      t.text :tresc
      t.references :uzytkownik
      t.references :dokument, :polymorphic => true
      t.timestamps
    end
  end

  def self.down
    drop_table :komentarze
  end
end
