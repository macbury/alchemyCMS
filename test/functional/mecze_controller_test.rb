require File.dirname(__FILE__) + '/../test_helper'

class MeczeControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:mecze)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_mecz
    assert_difference('Mecz.count') do
      post :create, :mecz => { }
    end

    assert_redirected_to mecz_path(assigns(:mecz))
  end

  def test_should_show_mecz
    get :show, :id => mecze(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => mecze(:one).id
    assert_response :success
  end

  def test_should_update_mecz
    put :update, :id => mecze(:one).id, :mecz => { }
    assert_redirected_to mecz_path(assigns(:mecz))
  end

  def test_should_destroy_mecz
    assert_difference('Mecz.count', -1) do
      delete :destroy, :id => mecze(:one).id
    end

    assert_redirected_to mecze_path
  end
end
