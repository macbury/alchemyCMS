require File.dirname(__FILE__) + '/../test_helper'

class AktualnosciControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:aktualnosci)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_aktualnosc
    assert_difference('Aktualnosc.count') do
      post :create, :aktualnosc => { }
    end

    assert_redirected_to aktualnosc_path(assigns(:aktualnosc))
  end

  def test_should_show_aktualnosc
    get :show, :id => aktualnosci(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => aktualnosci(:one).id
    assert_response :success
  end

  def test_should_update_aktualnosc
    put :update, :id => aktualnosci(:one).id, :aktualnosc => { }
    assert_redirected_to aktualnosc_path(assigns(:aktualnosc))
  end

  def test_should_destroy_aktualnosc
    assert_difference('Aktualnosc.count', -1) do
      delete :destroy, :id => aktualnosci(:one).id
    end

    assert_redirected_to aktualnosci_path
  end
end
