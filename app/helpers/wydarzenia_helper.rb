module WydarzeniaHelper
  def video(id)
    if id.include?('youtube')
      link = id.gsub('http://pl.youtube.com/watch?v=','') 
      render :partial => 'movie/youtube', :locals => { :link => link }
    else
      if id.include?('vimeo')
        link = id.gsub('http://www.vimeo.com/','') 
        render :partial => 'movie/vimeo', :locals => { :link => link }
      end
    end
  end
  
  def wydarzenie_komentarze_link(wydarzenie)
    ile = wydarzenie.komentarze.count
    if ile == 0
      str = 'Skomentuj to wydarzenie'
    else
      str = "Komentarze ( #{ile} )"
    end
    content_tag :a, str, :href => "#{wydarzenie_url(wydarzenie)}/1#komentarze"
  end
  
end