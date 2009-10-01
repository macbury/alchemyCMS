class Admin::StronyController < ApplicationController
  before_filter :moderator, :except => :opcje
  before_filter :admin, :only => :opcje
  
  def index
    @strony = Strona.find(:all,
                          :select => "`nazwa`, `id`, `created_at`, `permalink`", 
                          :order => "`created_at` DESC")
  end
  
  def new
    @strona = Strona.new
  end
  
  def create
    @strona = Strona.create(params[:strona])
    if @strona.save
      Link.create :nazwa => @strona.nazwa, :hyperlink => "/#{@strona.permalink}"
      flash[:notice] = "Dodano nową stronę!"
      redirect_to admin_strony_path
    else
      render :action => "new"
    end
  end
  
  def edit
    @strona = Strona.find_by_permalink(params[:id])
    render :action => "new"
  end
  
  def update
    @strona = Strona.find_by_permalink(params[:id])
    if @strona.update_attributes(params[:strona])
      flash[:notice] = "Zapisano zmiany!"
      redirect_to admin_strony_path
    else
      render :action => "new"
    end
  end
  
  def show
    redirect_to strona params[:id]
  end
  
  def destroy
    respond_to do |format|
      format.html { redirect_to :action => "index" }
      format.js {
        @strona = Strona.find(params[:id])
        @strona.destroy
        render :nothing => true
      }
    end
  end
  
  def opcje
    return unless request.post?
    
    ['strona', 'akismet'].each do | key |
      KONFIG[key] = params[key] unless params[key].blank?
    end
    
    
    File.open("#{RAILS_ROOT}/config/konfiguracja.yml", "w") do | out |
      YAML.dump(KONFIG, out)
    end
    
    flash[:notice] = "Zapisano zmiany!"
  end
end