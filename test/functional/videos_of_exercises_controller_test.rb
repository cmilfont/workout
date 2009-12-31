require 'test_helper'

class VideosOfExercisesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:videos_of_exercises)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create videos_of_exercise" do
    assert_difference('VideosOfExercise.count') do
      post :create, :videos_of_exercise => { }
    end

    assert_redirected_to videos_of_exercise_path(assigns(:videos_of_exercise))
  end

  test "should show videos_of_exercise" do
    get :show, :id => videos_of_exercises(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => videos_of_exercises(:one).to_param
    assert_response :success
  end

  test "should update videos_of_exercise" do
    put :update, :id => videos_of_exercises(:one).to_param, :videos_of_exercise => { }
    assert_redirected_to videos_of_exercise_path(assigns(:videos_of_exercise))
  end

  test "should destroy videos_of_exercise" do
    assert_difference('VideosOfExercise.count', -1) do
      delete :destroy, :id => videos_of_exercises(:one).to_param
    end

    assert_redirected_to videos_of_exercises_path
  end
end
