class CreateStrony < ActiveRecord::Migration
  def self.up
    create_table :strony do |t|
      t.string :nazwa
      t.text :tresc
      t.string :permalink

      t.timestamps
    end
  end

  def self.down
    drop_table :strony
  end
end
