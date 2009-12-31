require 'test_helper'

class CommentsOfExercisesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:comments_of_exercises)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create comments_of_exercise" do
    assert_difference('CommentsOfExercise.count') do
      post :create, :comments_of_exercise => { }
    end

    assert_redirected_to comments_of_exercise_path(assigns(:comments_of_exercise))
  end

  test "should show comments_of_exercise" do
    get :show, :id => comments_of_exercises(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => comments_of_exercises(:one).to_param
    assert_response :success
  end

  test "should update comments_of_exercise" do
    put :update, :id => comments_of_exercises(:one).to_param, :comments_of_exercise => { }
    assert_redirected_to comments_of_exercise_path(assigns(:comments_of_exercise))
  end

  test "should destroy comments_of_exercise" do
    assert_difference('CommentsOfExercise.count', -1) do
      delete :destroy, :id => comments_of_exercises(:one).to_param
    end

    assert_redirected_to comments_of_exercises_path
  end
end
