require 'test_helper'

class Admins::QuestionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_questions_index_url
    assert_response :success
  end

  test "should get show" do
    get admins_questions_show_url
    assert_response :success
  end

end
