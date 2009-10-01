class Strona < ActiveRecord::Base
  validates_presence_of :nazwa, :tresc, :message => " nie może być puste!"
  
  has_permalink :nazwa
  
  def to_param
    permalink
  end
end