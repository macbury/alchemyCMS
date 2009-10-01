module LinkHelper
  
  def wydarzenia_link(wydarzenie, tekst = nil)
    if tekst.nil?
      a = wydarzenie.tytul
    else
      a = tekst
    end
    
    link_to a, wydarzenie_url(wydarzenie)
  end
  
  def wydarzenie_url(wydarzenie)
    url_for :controller => '/wydarzenia', 
            :action => 'show', 
            :rok => wydarzenie.created_at.strftime('%Y'),
            :miesiac => wydarzenie.created_at.strftime('%m'),
            :id => wydarzenie.permalink,
            :page => 1
  end
  
  def rok_link(obj)
    aktualny_rok = params[:rok].nil? ? Time.new.year : params[:rok]
    if obj.rok == aktualny_rok
      content_tag :b, obj.rok
    else
      link_to obj.rok, :action => 'index', :rok => obj.rok
    end
  end
  
end