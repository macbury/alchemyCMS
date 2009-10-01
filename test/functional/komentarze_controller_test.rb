require File.dirname(__FILE__) + '/../test_helper'

class KomentarzeControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:komentarze)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_komentarz
    assert_difference('Komentarz.count') do
      post :create, :komentarz => { }
    end

    assert_redirected_to komentarz_path(assigns(:komentarz))
  end

  def test_should_show_komentarz
    get :show, :id => komentarze(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => komentarze(:one).id
    assert_response :success
  end

  def test_should_update_komentarz
    put :update, :id => komentarze(:one).id, :komentarz => { }
    assert_redirected_to komentarz_path(assigns(:komentarz))
  end

  def test_should_destroy_komentarz
    assert_difference('Komentarz.count', -1) do
      delete :destroy, :id => komentarze(:one).id
    end

    assert_redirected_to komentarze_path
  end
end
