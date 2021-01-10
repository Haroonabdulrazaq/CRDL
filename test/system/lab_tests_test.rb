# frozen_string_literal: true

require 'application_system_test_case'

class LabTestsTest < ApplicationSystemTestCase
  setup do
    @lab_test = lab_tests(:one)
  end

  test 'visiting the index' do
    visit lab_tests_url
    assert_selector 'h1', text: 'Lab Tests'
  end

  test 'creating a Lab test' do
    visit lab_tests_url
    click_on 'New Lab Test'

    fill_in 'Department for test', with: @lab_test.department_for_test_id
    fill_in 'Description', with: @lab_test.description
    fill_in 'Price per unit', with: @lab_test.price_per_unit
    fill_in 'Title', with: @lab_test.title
    fill_in 'User', with: @lab_test.user_id
    click_on 'Create Lab test'

    assert_text 'Lab test was successfully created'
    click_on 'Back'
  end

  test 'updating a Lab test' do
    visit lab_tests_url
    click_on 'Edit', match: :first

    fill_in 'Department for test', with: @lab_test.department_for_test_id
    fill_in 'Description', with: @lab_test.description
    fill_in 'Price per unit', with: @lab_test.price_per_unit
    fill_in 'Title', with: @lab_test.title
    fill_in 'User', with: @lab_test.user_id
    click_on 'Update Lab test'

    assert_text 'Lab test was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Lab test' do
    visit lab_tests_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Lab test was successfully destroyed'
  end
end
