require 'test_helper'

class SimpleCrmsControllerTest < ActionController::TestCase
  setup do
    @simple_crm = simple_crms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:simple_crms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create simple_crm" do
    assert_difference('SimpleCrm.count') do
      post :create, simple_crm: {  }
    end

    assert_redirected_to simple_crm_path(assigns(:simple_crm))
  end

  test "should show simple_crm" do
    get :show, id: @simple_crm
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @simple_crm
    assert_response :success
  end

  test "should update simple_crm" do
    patch :update, id: @simple_crm, simple_crm: {  }
    assert_redirected_to simple_crm_path(assigns(:simple_crm))
  end

  test "should destroy simple_crm" do
    assert_difference('SimpleCrm.count', -1) do
      delete :destroy, id: @simple_crm
    end

    assert_redirected_to simple_crms_path
  end
end
