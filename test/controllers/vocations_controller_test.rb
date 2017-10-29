require 'test_helper'

class VocationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vocation = vocations(:one)
  end

  test "should get index" do
    get vocations_url
    assert_response :success
  end

  test "should get new" do
    get new_vocation_url
    assert_response :success
  end

  test "should create vocation" do
    assert_difference('Vocation.count') do
      post vocations_url, params: { vocation: { contract_id: @vocation.contract_id, d_conclusion_v: @vocation.d_conclusion_v, d_expiration_v: @vocation.d_expiration_v, is_real: @vocation.is_real, order_date: @vocation.order_date, order_number: @vocation.order_number, type_v: @vocation.type_v } }
    end

    assert_redirected_to vocation_url(Vocation.last)
  end

  test "should show vocation" do
    get vocation_url(@vocation)
    assert_response :success
  end

  test "should get edit" do
    get edit_vocation_url(@vocation)
    assert_response :success
  end

  test "should update vocation" do
    patch vocation_url(@vocation), params: { vocation: { contract_id: @vocation.contract_id, d_conclusion_v: @vocation.d_conclusion_v, d_expiration_v: @vocation.d_expiration_v, is_real: @vocation.is_real, order_date: @vocation.order_date, order_number: @vocation.order_number, type_v: @vocation.type_v } }
    assert_redirected_to vocation_url(@vocation)
  end

  test "should destroy vocation" do
    assert_difference('Vocation.count', -1) do
      delete vocation_url(@vocation)
    end

    assert_redirected_to vocations_url
  end
end
