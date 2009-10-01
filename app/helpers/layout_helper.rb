module LayoutHelper
  def strona_tytul
    tytul = String.new
    tytul = KONFIG["strona"]["nazwa_krotka"]

    return tytul
  end
  
  def title_tag
    tytul = String.new
    unless @tytul.nil?
      str = KONFIG["strona"]["nazwa_krotka"]
      tytul = "#{str} - #{@tytul}"
    else
      tytul = KONFIG["strona"]["nazwa"]
    end
    content_tag :title, tytul
  end
  
  
  def strona_opis
    KONFIG["strona"]["opis"]
  end
  
  def slowa_kluczowe
    KONFIG["strona"]["keywords"]
  end
  
  def menu_item(link)
    "menuItem_#{link.id.to_s}"
  end
  
  def generuj_menu
    @linki = Link.find_ordered
    
    out = String.new
    @linki.each do |link|
      out += tab_to(link.nazwa, link.hyperlink)
    end
    
    return out
  end
  
  def tab_to(tekst, link, css = 'sel', html = :li )
    content_tag(html, 
  			link_to(tekst, link),
  			request.request_uri.include?(link) ? { :class => css } : {})
  end
  
end