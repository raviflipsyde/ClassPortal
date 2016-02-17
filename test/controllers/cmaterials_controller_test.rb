require 'test_helper'

class CmaterialsControllerTest < ActionController::TestCase
  setup do
    @cmaterial = cmaterials(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cmaterials)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cmaterial" do
    assert_difference('Cmaterial.count') do
      post :create, cmaterial: { content: @cmaterial.content, course_id: @cmaterial.course_id }
    end

    assert_redirected_to cmaterial_path(assigns(:cmaterial))
  end

  test "should show cmaterial" do
    get :show, id: @cmaterial
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cmaterial
    assert_response :success
  end

  test "should update cmaterial" do
    patch :update, id: @cmaterial, cmaterial: { content: @cmaterial.content, course_id: @cmaterial.course_id }
    assert_redirected_to cmaterial_path(assigns(:cmaterial))
  end

  test "should destroy cmaterial" do
    assert_difference('Cmaterial.count', -1) do
      delete :destroy, id: @cmaterial
    end

    assert_redirected_to cmaterials_path
  end
end
