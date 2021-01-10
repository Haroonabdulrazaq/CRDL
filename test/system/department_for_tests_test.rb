require "application_system_test_case"

class DepartmentForTestsTest < ApplicationSystemTestCase
  setup do
    @department_for_test = department_for_tests(:one)
  end

  test "visiting the index" do
    visit department_for_tests_url
    assert_selector "h1", text: "Department For Tests"
  end

  test "creating a Department for test" do
    visit department_for_tests_url
    click_on "New Department For Test"

    fill_in "Description", with: @department_for_test.description
    fill_in "Title", with: @department_for_test.title
    fill_in "User", with: @department_for_test.user_id
    click_on "Create Department for test"

    assert_text "Department for test was successfully created"
    click_on "Back"
  end

  test "updating a Department for test" do
    visit department_for_tests_url
    click_on "Edit", match: :first

    fill_in "Description", with: @department_for_test.description
    fill_in "Title", with: @department_for_test.title
    fill_in "User", with: @department_for_test.user_id
    click_on "Update Department for test"

    assert_text "Department for test was successfully updated"
    click_on "Back"
  end

  test "destroying a Department for test" do
    visit department_for_tests_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Department for test was successfully destroyed"
  end
end
