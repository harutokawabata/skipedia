require 'test_helper'

class Admin::HistoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_histories_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_histories_show_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_histories_destroy_url
    assert_response :success
  end

end
