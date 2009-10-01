module AuthenticatedTestHelper
  # Sets the current uzytkownik in the session from the uzytkownik fixtures.
  def login_as(uzytkownik)
    @request.session[:uzytkownik_id] = uzytkownik ? uzytkownicy(uzytkownik).id : nil
  end

  def authorize_as(user)
    @request.env["HTTP_AUTHORIZATION"] = user ? ActionController::HttpAuthentication::Basic.encode_credentials(users(user).login, 'test') : nil
  end
end
