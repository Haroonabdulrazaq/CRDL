require 'test_helper'

class LabTestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lab_test = lab_tests(:one)
  end

  test "should get index" do
    get lab_tests_url
    assert_response :success
  end

  test "should get new" do
    get new_lab_test_url
    assert_response :success
  end

  test "should create lab_test" do
    assert_difference('LabTest.count') do
      post lab_tests_url, params: { lab_test: { department_for_test_id: @lab_test.department_for_test_id, description: @lab_test.description, price_per_unit: @lab_test.price_per_unit, title: @lab_test.title, user_id: @lab_test.user_id } }
    end

    assert_redirected_to lab_test_url(LabTest.last)
  end

  test "should show lab_test" do
    get lab_test_url(@lab_test)
    assert_response :success
  end

  test "should get edit" do
    get edit_lab_test_url(@lab_test)
    assert_response :success
  end

  test "should update lab_test" do
    patch lab_test_url(@lab_test), params: { lab_test: { department_for_test_id: @lab_test.department_for_test_id, description: @lab_test.description, price_per_unit: @lab_test.price_per_unit, title: @lab_test.title, user_id: @lab_test.user_id } }
    assert_redirected_to lab_test_url(@lab_test)
  end

  test "should destroy lab_test" do
    assert_difference('LabTest.count', -1) do
      delete lab_test_url(@lab_test)
    end

    assert_redirected_to lab_tests_url
  end
end
