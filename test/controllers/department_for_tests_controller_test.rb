# frozen_string_literal: true

require 'test_helper'

class DepartmentForTestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @department_for_test = department_for_tests(:one)
  end

  test 'should get index' do
    get department_for_tests_url
    assert_response :success
  end

  test 'should get new' do
    get new_department_for_test_url
    assert_response :success
  end

  test 'should create department_for_test' do
    assert_difference('DepartmentForTest.count') do
      post department_for_tests_url,
           params: { department_for_test: { description: @department_for_test.description, title: @department_for_test.title,
                                            user_id: @department_for_test.user_id } }
    end

    assert_redirected_to department_for_test_url(DepartmentForTest.last)
  end

  test 'should show department_for_test' do
    get department_for_test_url(@department_for_test)
    assert_response :success
  end

  test 'should get edit' do
    get edit_department_for_test_url(@department_for_test)
    assert_response :success
  end

  test 'should update department_for_test' do
    patch department_for_test_url(@department_for_test),
          params: { department_for_test: { description: @department_for_test.description, title: @department_for_test.title,
                                           user_id: @department_for_test.user_id } }
    assert_redirected_to department_for_test_url(@department_for_test)
  end

  test 'should destroy department_for_test' do
    assert_difference('DepartmentForTest.count', -1) do
      delete department_for_test_url(@department_for_test)
    end

    assert_redirected_to department_for_tests_url
  end
end
