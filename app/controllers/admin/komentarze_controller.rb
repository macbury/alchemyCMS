class Admin::KomentarzeController < ApplicationController
  before_filter :login_required, :except => :create
  before_filter :moderator, :except => :create
  
  in_place_edit_for :komentarz, :tresc
  
  def index
    @komentarze = Komentarz.find_all_by_akceptowany(true, :order => "created_at DESC", :limit => 10)
    @spam = Komentarz.find_all_by_akceptowany(false, :order => "created_at DESC", :limit => 50)
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @admin_komentarze }
    end
  end
  
  def show
    @komentarz = Komentarz.find(params[:id])
    
    respond_to do |format|
      format.js { render :inline => @komentarz.tresc }
    end
  end  
  
  def edit
    @komentarz = Komentarz.find(params[:id])
    
    respond_to do |format|
      format.js { render :inline => @komentarz.tresc }
    end
  end
  
  def create
    obj = root_object
    @komentarz = obj.komentarze.new(params[:komentarz])
    @komentarz.uzytkownik = self.current_uzytkownik
    @komentarz.request = request
    @komentarz.save
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end

  # PUT /admin_komentarze/1
  # PUT /admin_komentarze/1.xml
  def update
    @komentarz = Komentarz.find(params[:id])
    @komentarz.tresc = params[:value]
    respond_to do |format|
      if @komentarz.save
        format.js { render :inline => "<%= simple_format h (@komentarz.tresc) %>" }
      else
        format.js { render :nothing => true }
      end
    end
  end

  # DELETE /admin_komentarze/1
  # DELETE /admin_komentarze/1.xml
  def destroy
    unless params[:komentarze_ids].nil?
      Komentarz.destroy(params[:komentarze_ids])
    else
      @komentarz = Komentarz.find(params[:id])
      @komentarz.destroy
    end

    respond_to do |format|
      format.html { redirect_to(admin_komentarze_path) }
      format.js { render :nothing => true }
    end
  end
  
  def spam
    @komentarz = Komentarz.find(params[:id])
    @komentarz.spam!
    
    render :nothing => true
  end
  
  def ham
    @komentarz = Komentarz.find(params[:id])
    @komentarz.ham!
    
    render :nothing => true
  end
  
  protected
    def root_object
      case params[:typ]
        when 'wydarzenie' then Wydarzenie.find(params[:id])
        else redirect_to root_path
      end
    end
    
end
