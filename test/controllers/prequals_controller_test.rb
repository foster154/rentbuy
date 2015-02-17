require 'test_helper'

class PrequalsControllerTest < ActionController::TestCase
  setup do
    @prequal = prequals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:prequals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create prequal" do
    assert_difference('Prequal.count') do
      post :create, prequal: { debt: @prequal.debt, down_payment: @prequal.down_payment, guest_id: @prequal.guest_id, income: @prequal.income }
    end

    assert_redirected_to prequal_path(assigns(:prequal))
  end

  test "should show prequal" do
    get :show, id: @prequal
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @prequal
    assert_response :success
  end

  test "should update prequal" do
    patch :update, id: @prequal, prequal: { debt: @prequal.debt, down_payment: @prequal.down_payment, guest_id: @prequal.guest_id, income: @prequal.income }
    assert_redirected_to prequal_path(assigns(:prequal))
  end

  test "should destroy prequal" do
    assert_difference('Prequal.count', -1) do
      delete :destroy, id: @prequal
    end

    assert_redirected_to prequals_path
  end
end
