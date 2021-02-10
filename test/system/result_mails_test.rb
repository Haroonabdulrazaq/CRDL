require "application_system_test_case"

class ResultMailsTest < ApplicationSystemTestCase
  setup do
    @result_mail = result_mails(:one)
  end

  test "visiting the index" do
    visit result_mails_url
    assert_selector "h1", text: "Result Mails"
  end

  test "creating a Result mail" do
    visit result_mails_url
    click_on "New Result Mail"

    fill_in "Email message", with: @result_mail.email_message
    fill_in "Email object", with: @result_mail.email_object
    fill_in "Recipient email", with: @result_mail.recipient_email
    fill_in "User", with: @result_mail.user_id
    click_on "Create Result mail"

    assert_text "Result mail was successfully created"
    click_on "Back"
  end

  test "updating a Result mail" do
    visit result_mails_url
    click_on "Edit", match: :first

    fill_in "Email message", with: @result_mail.email_message
    fill_in "Email object", with: @result_mail.email_object
    fill_in "Recipient email", with: @result_mail.recipient_email
    fill_in "User", with: @result_mail.user_id
    click_on "Update Result mail"

    assert_text "Result mail was successfully updated"
    click_on "Back"
  end

  test "destroying a Result mail" do
    visit result_mails_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Result mail was successfully destroyed"
  end
end
