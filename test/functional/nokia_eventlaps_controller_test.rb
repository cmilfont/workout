require 'test_helper'

class NokiaEventlapsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:nokia_eventlaps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create nokia_eventlap" do
    assert_difference('NokiaEventlap.count') do
      post :create, :nokia_eventlap => { }
    end

    assert_redirected_to nokia_eventlap_path(assigns(:nokia_eventlap))
  end

  test "should show nokia_eventlap" do
    get :show, :id => nokia_eventlaps(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => nokia_eventlaps(:one).to_param
    assert_response :success
  end

  test "should update nokia_eventlap" do
    put :update, :id => nokia_eventlaps(:one).to_param, :nokia_eventlap => { }
    assert_redirected_to nokia_eventlap_path(assigns(:nokia_eventlap))
  end

  test "should destroy nokia_eventlap" do
    assert_difference('NokiaEventlap.count', -1) do
      delete :destroy, :id => nokia_eventlaps(:one).to_param
    end

    assert_redirected_to nokia_eventlaps_path
  end
end
