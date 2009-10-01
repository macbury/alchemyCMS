class SesjaController < ApplicationController
  def zaloguj
    respond_to do |format|
      format.html
      format.js do
        return unless request.post?
        self.current_uzytkownik = Uzytkownik.authenticate(params[:login], params[:password])
        if logged_in?
          if params[:remember_me] == "1"
            self.current_uzytkownik.remember_me
            cookies[:auth_token] = { :value => self.current_uzytkownik.remember_token , :expires => self.current_uzytkownik.remember_token_expires_at }
          end   
        end
      end
    end

  end
  
  def przekieruj
    redirect_to KONFIG['strona']['glowna']
  end
  
  def ieshit
    session[:ie] = true
    redirect_to root_path
  end
end