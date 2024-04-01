require "test_helper"

class Admin::BoardCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_board_comments_index_url
    assert_response :success
  end

  test "should get delete" do
    get admin_board_comments_delete_url
    assert_response :success
  end
end
