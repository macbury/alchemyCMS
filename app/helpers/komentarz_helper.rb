module KomentarzHelper
  def link_to_gg(obj)
    link_to image_tag("http://www.gadu-gadu.pl/users/status.asp?id=#{obj.gg}&styl=1"), "gg:#{obj.gg}" unless obj.gg.nil?
  end
  
  def link_to_tlen(obj)
    tekst = h obj.tlen
    link_to image_tag("http://status.tlen.pl/?u=#{tekst}&t=1"), "http://ludzie.tlen.pl/#{tekst}/" unless tekst.blank?
  end
  
  def link_to_skype(obj)
    tekst = h obj.skype
    link_to image_tag("http://mystatus.skype.com/smallicon/#{tekst}"), "skype:#{tekst}?userinfo" unless tekst.blank?
  end
  
  def render_komentarze(typ)
    @komentarz = Komentarz.new
    render :partial => '/admin/komentarze/block', :locals => { :typ => typ }
  end
  
  def usun_komentarz(komentarz)
    link_to_remote 'Usuń', :url => { :controller=> 'admin/komentarze', :action => 'destroy', :id => komentarz } ,:complete => visual_effect(:BlindUp, "komentarz_#{komentarz.id}") 
  end
  
  def spam_komentarz(komentarz)
    link_to_remote 'SPAM', :url => { :controller=> 'admin/komentarze', :action => 'spam', :id => komentarz } ,:complete => visual_effect(:BlindUp, "komentarz_#{komentarz.id}") 
  end
  
  def ham_komentarz(komentarz)
    link_to_remote 'Nie spam', :url => { :controller=> 'admin/komentarze', :action => 'ham', :id => komentarz } ,:complete => visual_effect(:BlindUp, "komentarz_#{komentarz.id}") 
  end

end