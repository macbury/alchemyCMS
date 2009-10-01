class Admin::UzytkownicyController < ApplicationController
  before_filter :admin, :except => [:wyloguj, :profil, :update]
  
  def index
    @uzytkownicy = Uzytkownik.paginate :per_page => 10, :page => params[:page]
  end

  def destroy
    @uztykownik = Uzytkownik.find params[:id]
    @uztykownik.destroy
    render :nothing => true
  end
  
  def new
    @uzytkownik = Uzytkownik.new
  end

  def create
    cookies.delete :auth_token
    @uzytkownik = Uzytkownik.create(params[:uzytkownik])
    @uzytkownik.save
    if @uzytkownik.errors.empty?
      redirect_to admin_uzytkownicy_path
      flash[:notice] = "Dodano nowego użytkownika"
    else
      render :action => 'new'
    end
  end
  
  def edit
    @uzytkownik = Uzytkownik.find(params[:id])
    render :action => 'new'
  end
  
  def update
    if admin?
      @uzytkownik = Uzytkownik.find(params[:id])
    else
      @uzytkownik = self.current_uzytkownik
    end
    
    if @uzytkownik.update_attributes(params[:uzytkownik])
      flash[:notice] = "Zapisano zmiany"
      if admin?
        redirect_to admin_uzytkownicy_path
      else
        render :action => 'profil'
      end
    else
      if admin?
        render :action => "new"
      else
        render :action => 'profil'
      end
    end
  end
  
  def profil
    @uzytkownik = self.current_uzytkownik
  end
  
  def wyloguj
    self.current_uzytkownik.forget_me if logged_in?
    cookies.delete :auth_token
    reset_session
    flash[:notice] = "Zostałeś wylogowany!"
    redirect_back_or_default('/')
  end

end
