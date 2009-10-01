require File.dirname(__FILE__) + '/../test_helper'
require 'uzytkownicy_controller'

# Re-raise errors caught by the controller.
class UzytkownicyController; def rescue_action(e) raise e end; end

class UzytkownicyControllerTest < Test::Unit::TestCase
  # Be sure to include AuthenticatedTestHelper in test/test_helper.rb instead
  # Then, you can remove it from this and the units test.
  include AuthenticatedTestHelper

  fixtures :uzytkownicy

  def setup
    @controller = UzytkownicyController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  def test_should_allow_signup
    assert_difference 'Uzytkownik.count' do
      create_uzytkownik
      assert_response :redirect
    end
  end

  def test_should_require_login_on_signup
    assert_no_difference 'Uzytkownik.count' do
      create_uzytkownik(:login => nil)
      assert assigns(:uzytkownik).errors.on(:login)
      assert_response :success
    end
  end

  def test_should_require_password_on_signup
    assert_no_difference 'Uzytkownik.count' do
      create_uzytkownik(:password => nil)
      assert assigns(:uzytkownik).errors.on(:password)
      assert_response :success
    end
  end

  def test_should_require_password_confirmation_on_signup
    assert_no_difference 'Uzytkownik.count' do
      create_uzytkownik(:password_confirmation => nil)
      assert assigns(:uzytkownik).errors.on(:password_confirmation)
      assert_response :success
    end
  end

  def test_should_require_email_on_signup
    assert_no_difference 'Uzytkownik.count' do
      create_uzytkownik(:email => nil)
      assert assigns(:uzytkownik).errors.on(:email)
      assert_response :success
    end
  end
  

  protected
    def create_uzytkownik(options = {})
      post :create, :uzytkownik => { :login => 'quire', :email => 'quire@example.com',
        :password => 'quire', :password_confirmation => 'quire' }.merge(options)
    end
end
