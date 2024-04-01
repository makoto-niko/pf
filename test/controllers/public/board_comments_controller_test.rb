require "test_helper"

class Public::BoardCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_board_comments_index_url
    assert_response :success
  end

  test "should get create" do
    get public_board_comments_create_url
    assert_response :success
  end

  test "should get delete" do
    get public_board_comments_delete_url
    assert_response :success
  end
end
