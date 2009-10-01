require File.dirname(__FILE__) + '/../test_helper'

class TabeleControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:tabele)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_tabela
    assert_difference('Tabela.count') do
      post :create, :tabela => { }
    end

    assert_redirected_to tabela_path(assigns(:tabela))
  end

  def test_should_show_tabela
    get :show, :id => tabele(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => tabele(:one).id
    assert_response :success
  end

  def test_should_update_tabela
    put :update, :id => tabele(:one).id, :tabela => { }
    assert_redirected_to tabela_path(assigns(:tabela))
  end

  def test_should_destroy_tabela
    assert_difference('Tabela.count', -1) do
      delete :destroy, :id => tabele(:one).id
    end

    assert_redirected_to tabele_path
  end
end
