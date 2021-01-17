require 'test_helper'

class Admins::HistoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_histories_index_url
    assert_response :success
  end

  test "should get show" do
    get admins_histories_show_url
    assert_response :success
  end

  test "should get destroy" do
    get admins_histories_destroy_url
    assert_response :success
  end

end
