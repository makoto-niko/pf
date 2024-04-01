require "test_helper"

class Public::GroupsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_groups_index_url
    assert_response :success
  end

  test "should get show" do
    get public_groups_show_url
    assert_response :success
  end

  test "should get create" do
    get public_groups_create_url
    assert_response :success
  end

  test "should get update" do
    get public_groups_update_url
    assert_response :success
  end

  test "should get delete" do
    get public_groups_delete_url
    assert_response :success
  end
end
