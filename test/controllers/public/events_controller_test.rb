require 'test_helper'

class Public::EventsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_events_index_url
    assert_response :success
  end

  test "should get show" do
    get public_events_show_url
    assert_response :success
  end

  test "should get confirm" do
    get public_events_confirm_url
    assert_response :success
  end

  test "should get withdraw" do
    get public_events_withdraw_url
    assert_response :success
  end

  test "should get cancel" do
    get public_events_cancel_url
    assert_response :success
  end

end
