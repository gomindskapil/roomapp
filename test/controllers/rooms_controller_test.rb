require 'test_helper'

class RoomsControllerTest < ActionController::TestCase
  setup do
    @room = rooms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rooms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create room" do
    assert_difference('Room.count') do
      post :create, room: { accommodate: @room.accommodate, active: @room.active, address: @room.address, bath_room: @room.bath_room, bed_room: @room.bed_room, home_type: @room.home_type, is_air: @room.is_air, is_heating: @room.is_heating, is_internet: @room.is_internet, is_kitchen: @room.is_kitchen, is_tv: @room.is_tv, listing_name: @room.listing_name, price: @room.price, room_type: @room.room_type, summary: @room.summary, user_id: @room.user_id }
    end

    assert_redirected_to room_path(assigns(:room))
  end

  test "should show room" do
    get :show, id: @room
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @room
    assert_response :success
  end

  test "should update room" do
    patch :update, id: @room, room: { accommodate: @room.accommodate, active: @room.active, address: @room.address, bath_room: @room.bath_room, bed_room: @room.bed_room, home_type: @room.home_type, is_air: @room.is_air, is_heating: @room.is_heating, is_internet: @room.is_internet, is_kitchen: @room.is_kitchen, is_tv: @room.is_tv, listing_name: @room.listing_name, price: @room.price, room_type: @room.room_type, summary: @room.summary, user_id: @room.user_id }
    assert_redirected_to room_path(assigns(:room))
  end

  test "should destroy room" do
    assert_difference('Room.count', -1) do
      delete :destroy, id: @room
    end

    assert_redirected_to rooms_path
  end
end
