require File.dirname(__FILE__) + '/../test_helper'

class LinkiControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:linki)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_link
    assert_difference('Link.count') do
      post :create, :link => { }
    end

    assert_redirected_to link_path(assigns(:link))
  end

  def test_should_show_link
    get :show, :id => linki(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => linki(:one).id
    assert_response :success
  end

  def test_should_update_link
    put :update, :id => linki(:one).id, :link => { }
    assert_redirected_to link_path(assigns(:link))
  end

  def test_should_destroy_link
    assert_difference('Link.count', -1) do
      delete :destroy, :id => linki(:one).id
    end

    assert_redirected_to linki_path
  end
end
