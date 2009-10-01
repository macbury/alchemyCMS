require File.dirname(__FILE__) + '/../../test_helper'

class Admin::WydarzeniaControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_wydarzenia)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_wydarzenie
    assert_difference('Admin::Wydarzenie.count') do
      post :create, :wydarzenie => { }
    end

    assert_redirected_to wydarzenie_path(assigns(:wydarzenie))
  end

  def test_should_show_wydarzenie
    get :show, :id => admin_wydarzenia(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => admin_wydarzenia(:one).id
    assert_response :success
  end

  def test_should_update_wydarzenie
    put :update, :id => admin_wydarzenia(:one).id, :wydarzenie => { }
    assert_redirected_to wydarzenie_path(assigns(:wydarzenie))
  end

  def test_should_destroy_wydarzenie
    assert_difference('Admin::Wydarzenie.count', -1) do
      delete :destroy, :id => admin_wydarzenia(:one).id
    end

    assert_redirected_to admin_wydarzenia_path
  end
end
