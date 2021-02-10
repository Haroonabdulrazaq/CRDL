require 'test_helper'

class ResultMailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @result_mail = result_mails(:one)
  end

  test "should get index" do
    get result_mails_url
    assert_response :success
  end

  test "should get new" do
    get new_result_mail_url
    assert_response :success
  end

  test "should create result_mail" do
    assert_difference('ResultMail.count') do
      post result_mails_url, params: { result_mail: { email_message: @result_mail.email_message, email_object: @result_mail.email_object, recipient_email: @result_mail.recipient_email, user_id: @result_mail.user_id } }
    end

    assert_redirected_to result_mail_url(ResultMail.last)
  end

  test "should show result_mail" do
    get result_mail_url(@result_mail)
    assert_response :success
  end

  test "should get edit" do
    get edit_result_mail_url(@result_mail)
    assert_response :success
  end

  test "should update result_mail" do
    patch result_mail_url(@result_mail), params: { result_mail: { email_message: @result_mail.email_message, email_object: @result_mail.email_object, recipient_email: @result_mail.recipient_email, user_id: @result_mail.user_id } }
    assert_redirected_to result_mail_url(@result_mail)
  end

  test "should destroy result_mail" do
    assert_difference('ResultMail.count', -1) do
      delete result_mail_url(@result_mail)
    end

    assert_redirected_to result_mails_url
  end
end
