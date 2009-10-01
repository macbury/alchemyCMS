module FotkiHelper
  
  def generuj_galerie(fotki)
    html = String.new
    fotki.each { |fotka| html += link_to(image_tag(fotka.thumb_path), fotka.picture_path, {:rel => "lightbox[galeria]"}) }
    
    content_tag :div, html, :class => 'zdjecia'
  end
  
end