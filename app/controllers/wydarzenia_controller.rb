class WydarzeniaController < ApplicationController
  
  def index
    respond_to do |format|
      format.html do
        @wydarzenia = Wydarzenie.paginate :per_page => 5, 
                          :page => params[:page], 
                          :order => 'created_at DESC',
                          :select => 'id, tytul, SUBSTRING(tresc FROM 1 FOR 500) AS tresc, created_at, permalink'         
      end
      
      format.rss do
        @wydarzenia = Wydarzenie.find :all, 
                      :order => 'created_at DESC',
                      :select => 'id, tytul, SUBSTRING(tresc FROM 1 FOR 500) AS tresc, created_at, permalink'
      end
    end
  end
  
  def archiwum
    @tytul = 'Wydarzenia'
    
    @wydarzenia = Wydarzenie.find(:all,
      :order => 'wydarzenia.created_at DESC',
      :select => 'wydarzenia.tytul, wydarzenia.created_at, wydarzenia.permalink',
      :conditions => ['YEAR(wydarzenia.created_at) = ?', params[:rok]] ).group_by{ |wydarzenie| wydarzenie.created_at.strftime('%B') }
      
      @lata = Wydarzenie.find(:all, :select => 'YEAR(created_at) AS rok', :group => 'rok' )
  end
  
  def show
    @wydarzenie = Wydarzenie.find_by_permalink(params[:id], 
      :conditions => ['YEAR(wydarzenia.created_at) = ? AND MONTH(wydarzenia.created_at) = ?',params[:rok], params[:miesiac]],
      :include => [:galeria, :filmy] )
      
    @tytul = @wydarzenie.tytul
    
    @fotografie = Fotografia.find(@wydarzenie.galeria.katalog, 18) unless @wydarzenie.galeria.nil?
    @komentarze = @wydarzenie.komentarze.paginate_by_akceptowany true, :per_page => 10, 
                                                  :page => params[:page], 
                                                  :order => "komentarze.created_at DESC"
  end
  
end
