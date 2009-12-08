require 'test_helper'

class WeightGoalsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:weight_goals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create weight_goal" do
    assert_difference('WeightGoal.count') do
      post :create, :weight_goal => { }
    end

    assert_redirected_to weight_goal_path(assigns(:weight_goal))
  end

  test "should show weight_goal" do
    get :show, :id => weight_goals(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => weight_goals(:one).to_param
    assert_response :success
  end

  test "should update weight_goal" do
    put :update, :id => weight_goals(:one).to_param, :weight_goal => { }
    assert_redirected_to weight_goal_path(assigns(:weight_goal))
  end

  test "should destroy weight_goal" do
    assert_difference('WeightGoal.count', -1) do
      delete :destroy, :id => weight_goals(:one).to_param
    end

    assert_redirected_to weight_goals_path
  end
end
