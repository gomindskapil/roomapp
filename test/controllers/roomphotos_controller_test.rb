require 'test_helper'

class RoomphotosControllerTest < ActionController::TestCase
  setup do
    @roomphoto = roomphotos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:roomphotos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create roomphoto" do
    assert_difference('Roomphoto.count') do
      post :create, roomphoto: {  }
    end

    assert_redirected_to roomphoto_path(assigns(:roomphoto))
  end

  test "should show roomphoto" do
    get :show, id: @roomphoto
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @roomphoto
    assert_response :success
  end

  test "should update roomphoto" do
    patch :update, id: @roomphoto, roomphoto: {  }
    assert_redirected_to roomphoto_path(assigns(:roomphoto))
  end

  test "should destroy roomphoto" do
    assert_difference('Roomphoto.count', -1) do
      delete :destroy, id: @roomphoto
    end

    assert_redirected_to roomphotos_path
  end
end
