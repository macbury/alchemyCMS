require File.dirname(__FILE__) + '/../test_helper'

class ButtonyControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:buttony)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_button
    assert_difference('Button.count') do
      post :create, :button => { }
    end

    assert_redirected_to button_path(assigns(:button))
  end

  def test_should_show_button
    get :show, :id => buttony(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => buttony(:one).id
    assert_response :success
  end

  def test_should_update_button
    put :update, :id => buttony(:one).id, :button => { }
    assert_redirected_to button_path(assigns(:button))
  end

  def test_should_destroy_button
    assert_difference('Button.count', -1) do
      delete :destroy, :id => buttony(:one).id
    end

    assert_redirected_to buttony_path
  end
end
