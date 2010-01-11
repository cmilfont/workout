require 'test_helper'

class SynonymousOfExercisesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:synonymous_of_exercises)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create synonymous_of_exercise" do
    assert_difference('SynonymousOfExercise.count') do
      post :create, :synonymous_of_exercise => { }
    end

    assert_redirected_to synonymous_of_exercise_path(assigns(:synonymous_of_exercise))
  end

  test "should show synonymous_of_exercise" do
    get :show, :id => synonymous_of_exercises(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => synonymous_of_exercises(:one).to_param
    assert_response :success
  end

  test "should update synonymous_of_exercise" do
    put :update, :id => synonymous_of_exercises(:one).to_param, :synonymous_of_exercise => { }
    assert_redirected_to synonymous_of_exercise_path(assigns(:synonymous_of_exercise))
  end

  test "should destroy synonymous_of_exercise" do
    assert_difference('SynonymousOfExercise.count', -1) do
      delete :destroy, :id => synonymous_of_exercises(:one).to_param
    end

    assert_redirected_to synonymous_of_exercises_path
  end
end
