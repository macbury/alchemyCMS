require File.dirname(__FILE__) + '/../test_helper'

class GalerieControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:galerie)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_galeria
    assert_difference('Galeria.count') do
      post :create, :galeria => { }
    end

    assert_redirected_to galeria_path(assigns(:galeria))
  end

  def test_should_show_galeria
    get :show, :id => galerie(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => galerie(:one).id
    assert_response :success
  end

  def test_should_update_galeria
    put :update, :id => galerie(:one).id, :galeria => { }
    assert_redirected_to galeria_path(assigns(:galeria))
  end

  def test_should_destroy_galeria
    assert_difference('Galeria.count', -1) do
      delete :destroy, :id => galerie(:one).id
    end

    assert_redirected_to galerie_path
  end
end
