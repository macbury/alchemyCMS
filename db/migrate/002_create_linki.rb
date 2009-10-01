class CreateLinki < ActiveRecord::Migration
  def self.up
    create_table :linki do |t|
      t.string :nazwa
      t.string :hyperlink
      t.integer :order
    end
  end

  def self.down
    drop_table :linki
  end
end
