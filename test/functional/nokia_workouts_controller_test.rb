require 'test_helper'

class NokiaWorkoutsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:nokia_workouts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create nokia_workout" do
    assert_difference('NokiaWorkout.count') do
      post :create, :nokia_workout => { }
    end

    assert_redirected_to nokia_workout_path(assigns(:nokia_workout))
  end

  test "should show nokia_workout" do
    get :show, :id => nokia_workouts(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => nokia_workouts(:one).to_param
    assert_response :success
  end

  test "should update nokia_workout" do
    put :update, :id => nokia_workouts(:one).to_param, :nokia_workout => { }
    assert_redirected_to nokia_workout_path(assigns(:nokia_workout))
  end

  test "should destroy nokia_workout" do
    assert_difference('NokiaWorkout.count', -1) do
      delete :destroy, :id => nokia_workouts(:one).to_param
    end

    assert_redirected_to nokia_workouts_path
  end
end
