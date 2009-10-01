xml.instruct! :xml, :version => "1.0"

xml.rss "version" => "2.0" do
  xml.channel do
    xml.title KONFIG['strona']['nazwa']
    xml.link wydarzenia_path
    xml.description KONFIG['strona']['opis']

    @wydarzenia.each do |akt|
      xml.item do
        xml.title akt.tytul
        xml.description akt.tresc.gsub(/<\/?[^>]*>/, '')
        xml.pubDate akt.created_at.to_s(:rfc822)
        xml.link wydarzenie_url(akt)  
      end
    end
  end
end