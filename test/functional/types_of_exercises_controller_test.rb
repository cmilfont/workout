require 'test_helper'

class TypesOfExercisesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:types_of_exercises)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create types_of_exercise" do
    assert_difference('TypesOfExercise.count') do
      post :create, :types_of_exercise => { }
    end

    assert_redirected_to types_of_exercise_path(assigns(:types_of_exercise))
  end

  test "should show types_of_exercise" do
    get :show, :id => types_of_exercises(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => types_of_exercises(:one).to_param
    assert_response :success
  end

  test "should update types_of_exercise" do
    put :update, :id => types_of_exercises(:one).to_param, :types_of_exercise => { }
    assert_redirected_to types_of_exercise_path(assigns(:types_of_exercise))
  end

  test "should destroy types_of_exercise" do
    assert_difference('TypesOfExercise.count', -1) do
      delete :destroy, :id => types_of_exercises(:one).to_param
    end

    assert_redirected_to types_of_exercises_path
  end
end
