require "test_helper"

class Admin::PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get delete" do
    get admin_posts_delete_url
    assert_response :success
  end
end
