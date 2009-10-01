class DodajLinkiWydarzeniaPath < ActiveRecord::Migration
  def self.up
    Link.create :nazwa => "Wydarzenia", :hyperlink => "/wydarzenia", :order => 0
    Link.create :nazwa => "Archiwum wydarzeń", :hyperlink => "/archiwum", :order => 1
  end

  def self.down
  end
end
