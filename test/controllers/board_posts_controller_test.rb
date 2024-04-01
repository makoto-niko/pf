require "test_helper"

class BoardPostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @board_post = board_posts(:one)
  end

  test "should get index" do
    get board_posts_url
    assert_response :success
  end

  test "should get new" do
    get new_board_post_url
    assert_response :success
  end

  test "should create board_post" do
    assert_difference('BoardPost.count') do
      post board_posts_url, params: { board_post: { board_id: @board_post.board_id, content: @board_post.content, created_at: @board_post.created_at, updated_at: @board_post.updated_at, user_id: @board_post.user_id } }
    end

    assert_redirected_to board_post_url(BoardPost.last)
  end

  test "should show board_post" do
    get board_post_url(@board_post)
    assert_response :success
  end

  test "should get edit" do
    get edit_board_post_url(@board_post)
    assert_response :success
  end

  test "should update board_post" do
    patch board_post_url(@board_post), params: { board_post: { board_id: @board_post.board_id, content: @board_post.content, created_at: @board_post.created_at, updated_at: @board_post.updated_at, user_id: @board_post.user_id } }
    assert_redirected_to board_post_url(@board_post)
  end

  test "should destroy board_post" do
    assert_difference('BoardPost.count', -1) do
      delete board_post_url(@board_post)
    end

    assert_redirected_to board_posts_url
  end
end
