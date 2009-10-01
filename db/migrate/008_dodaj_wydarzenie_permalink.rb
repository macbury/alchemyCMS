class DodajWydarzeniePermalink < ActiveRecord::Migration
  def self.up
    add_column :wydarzenia, :permalink, :string
  end

  def self.down
  end
end
