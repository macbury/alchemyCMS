class Admin::WydarzeniaController < ApplicationController
  before_filter :moderator, :only => [:index, :destroy]
  
  def moje
    @wydarzenia = self.current_uzytkownik.wydarzenia.paginate(:per_page => 20, :page => params[:page], :order => "created_at DESC")
    
    render :action => 'index'
  end
  
  def index
    @wydarzenia = Wydarzenie.paginate(:per_page => 20, :page => params[:page], :order => "created_at DESC")
  end

  def new
    @wydarzenie = self.current_uzytkownik.wydarzenia.new
    2.times { @wydarzenie.filmy.build }
  end

  def edit
    @wydarzenie = self.current_uzytkownik.wydarzenia.find(params[:id])
    if @wydarzenie.canEdit?(self.current_uzytkownik)
      render :action => 'new'
    else
      noAccess
    end
  end

  def create
    @wydarzenie = self.current_uzytkownik.wydarzenia.new(params[:wydarzenie])
    if @wydarzenie.save
      flash[:notice] = 'Wydarzenie zostało utworzone'
      redirect_to_moderate
    else
      render :action => "new"
    end
  end

  def update
    @wydarzenie = self.current_uzytkownik.wydarzenia.find(params[:id])
    
    if @wydarzenie.canEdit?(self.current_uzytkownik)
      if @wydarzenie.update_attributes(params[:wydarzenie])
        flash[:notice] = 'Wydarzenie zostało zapisane'
        redirect_to_moderate
      else
        render :action => "new"
      end
    else
      noAccess
    end
  end

  def destroy
    @wydarzenie = Wydarzenie.find(params[:id])
    @wydarzenie.destroy

    render :nothing => true
  end
  
  def usun_film
    film = Film.find(params[:id])
    film.destroy

    render :nothing => true
  end
  
  protected
    def noAccess?
      render :file => "#{RAILS_ROOT}/public/422.html"
    end
    
    def redirect_to_moderate
      if moderator?
        redirect_to admin_wydarzenia_path 
      else
        redirect_to moje_admin_wydarzenia_path
      end
    end
end
