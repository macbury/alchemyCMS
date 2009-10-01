module AuthenticatedSystem
  protected
    # Returns true or false if the uzytkownik is logged in.
    # Preloads @current_uzytkownik with the uzytkownik model if they're logged in.
    def logged_in?
      current_uzytkownik
    end

    # Accesses the current uzytkownik from the session. 
    # Future calls avoid the database because nil is not equal to false.
    def current_uzytkownik
      @current_uzytkownik ||= (login_from_session || login_from_basic_auth || login_from_cookie) unless @current_uzytkownik == false
    end

    # Store the given uzytkownik id in the session.
    def current_uzytkownik=(new_uzytkownik)
      session[:uzytkownik_id] = new_uzytkownik ? new_uzytkownik.id : nil
      @current_uzytkownik = new_uzytkownik || false
    end

    # Check if the uzytkownik is authorized
    #
    # Override this method in your controllers if you want to restrict access
    # to only a few actions or if you want to check if the uzytkownik
    # has the correct rights.
    #
    # Example:
    #
    #  # only allow nonbobs
    #  def authorized?
    #    current_uzytkownik.login != "bob"
    #  end
    
    def admin
      render :file => "#{RAILS_ROOT}/public/422.html" unless (current_uzytkownik.uprawnienia == K_ADMIN )
    end
    
    def admin?
      (current_uzytkownik.uprawnienia == K_ADMIN) 
    end
    
    def moderator
      render :file => "#{RAILS_ROOT}/public/422.html" unless (current_uzytkownik.uprawnienia == K_MODERATOR) || (current_uzytkownik.uprawnienia == K_ADMIN)
    end
    
    def moderator?
      (current_uzytkownik.uprawnienia > K_USER)
    end
    
    def authorized?
      logged_in?
    end

    # Filter method to enforce a login requirement.
    #
    # To require logins for all actions, use this in your controllers:
    #
    #   before_filter :login_required
    #
    # To require logins for specific actions, use this in your controllers:
    #
    #   before_filter :login_required, :only => [ :edit, :update ]
    #
    # To skip this in a subclassed controller:
    #
    #   skip_before_filter :login_required
    #
    def login_required
      authorized? || access_denied
    end

    # Redirect as appropriate when an access request fails.
    #
    # The default action is to redirect to the login screen.
    #
    # Override this method in your controllers if you want to have special
    # behavior in case the uzytkownik is not authorized
    # to access the requested action.  For example, a popup window might
    # simply close itself.
    def access_denied
      respond_to do |format|
        format.html do
          store_location
          redirect_to zaloguj_path
        end
        format.any do
          request_http_basic_authentication 'Web Password'
        end
      end
    end

    # Store the URI of the current request in the session.
    #
    # We can return to this location by calling #redirect_back_or_default.
    def store_location
      session[:return_to] = request.request_uri
    end

    # Redirect to the URI stored by the most recent store_location call or
    # to the passed default.
    def redirect_back_or_default(default)
      redirect_to(session[:return_to] || default)
      session[:return_to] = nil
    end
    
    def ajax_redirect_back_or_default
      tmp = session[:return_to] || root_path
      session[:return_to] = nil
      
      return tmp
    end
    
    # Inclusion hook to make #current_uzytkownik and #logged_in?
    # available as ActionView helper methods.
    def self.included(base)
      base.send :helper_method, :current_uzytkownik, :logged_in?, :admin?, :moderator?, :ajax_redirect_back_or_default
    end

    # Called from #current_uzytkownik.  First attempt to login by the uzytkownik id stored in the session.
    def login_from_session
      self.current_uzytkownik = Uzytkownik.find_by_id(session[:uzytkownik_id]) if session[:uzytkownik_id]
    end

    # Called from #current_uzytkownik.  Now, attempt to login by basic authentication information.
    def login_from_basic_auth
      authenticate_with_http_basic do |username, password|
        self.current_uzytkownik = Uzytkownik.authenticate(username, password)
      end
    end

    # Called from #current_uzytkownik.  Finaly, attempt to login by an expiring token in the cookie.
    def login_from_cookie
      uzytkownik = cookies[:auth_token] && Uzytkownik.find_by_remember_token(cookies[:auth_token])
      if uzytkownik && uzytkownik.remember_token?
        uzytkownik.remember_me
        cookies[:auth_token] = { :value => uzytkownik.remember_token, :expires => uzytkownik.remember_token_expires_at }
        self.current_uzytkownik = uzytkownik
      end
    end
end
