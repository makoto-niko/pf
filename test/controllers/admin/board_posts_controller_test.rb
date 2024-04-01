require "test_helper"

class Admin::BoardPostsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_board_posts_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_board_posts_show_url
    assert_response :success
  end

  test "should get delete" do
    get admin_board_posts_delete_url
    assert_response :success
  end
end
