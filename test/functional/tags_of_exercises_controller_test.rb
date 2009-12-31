require 'test_helper'

class TagsOfExercisesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tags_of_exercises)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tags_of_exercise" do
    assert_difference('TagsOfExercise.count') do
      post :create, :tags_of_exercise => { }
    end

    assert_redirected_to tags_of_exercise_path(assigns(:tags_of_exercise))
  end

  test "should show tags_of_exercise" do
    get :show, :id => tags_of_exercises(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => tags_of_exercises(:one).to_param
    assert_response :success
  end

  test "should update tags_of_exercise" do
    put :update, :id => tags_of_exercises(:one).to_param, :tags_of_exercise => { }
    assert_redirected_to tags_of_exercise_path(assigns(:tags_of_exercise))
  end

  test "should destroy tags_of_exercise" do
    assert_difference('TagsOfExercise.count', -1) do
      delete :destroy, :id => tags_of_exercises(:one).to_param
    end

    assert_redirected_to tags_of_exercises_path
  end
end
