class Galeria < ActiveRecord::Base
  has_one :wydarzenie
  has_permalink :nazwa
end
