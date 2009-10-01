class Wydarzenie < ActiveRecord::Base
  belongs_to :uzytkownik
  validates_presence_of :tytul, :tresc, :message => "nie może być puste!"
  has_permalink :tytul
  has_many :komentarze, :as => :dokument, :dependent => :destroy
  has_many :filmy, :dependent => :destroy
  belongs_to :galeria
  
  attr_accessor :autor
  
  def film_attributes=(fi)
    fi.each do |film| 
      filmy.build(film) unless film[:url].blank?
    end
  end
  
  def autor
    uzytkownik.autor
  end
  
  def canEdit?(u)
    uzytkownik == u || moderator?
  end
  
  
end
