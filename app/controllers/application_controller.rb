# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base 
  
  include AuthenticatedSystem
  helper :all # include all helpers, all the time
  before_filter :przegladarka, :except => :ieshit
  
  
  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery #:secret => '5d0860820a8367c68ef2aca9408ef7ea'
  
  helper_method :ie?
  
  protected
    def przegladarka
      logger.debug request.env['HTTP_USER_AGENT']
      return unless session[:ie].nil?
      redirect_to '/firefox' if ie?
    end
    
    def ie?
      request.env['HTTP_USER_AGENT'].downcase.include?('msie')
    end
end
