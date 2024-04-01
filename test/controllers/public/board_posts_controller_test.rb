require "test_helper"

class Public::BoardPostsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_board_posts_index_url
    assert_response :success
  end

  test "should get show" do
    get public_board_posts_show_url
    assert_response :success
  end

  test "should get create" do
    get public_board_posts_create_url
    assert_response :success
  end

  test "should get update" do
    get public_board_posts_update_url
    assert_response :success
  end

  test "should get delete" do
    get public_board_posts_delete_url
    assert_response :success
  end
end
