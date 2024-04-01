require "application_system_test_case"

class BoardPostsTest < ApplicationSystemTestCase
  setup do
    @board_post = board_posts(:one)
  end

  test "visiting the index" do
    visit board_posts_url
    assert_selector "h1", text: "Board Posts"
  end

  test "creating a Board post" do
    visit board_posts_url
    click_on "New Board Post"

    fill_in "Board", with: @board_post.board_id
    fill_in "Content", with: @board_post.content
    fill_in "Created at", with: @board_post.created_at
    fill_in "Updated at", with: @board_post.updated_at
    fill_in "User", with: @board_post.user_id
    click_on "Create Board post"

    assert_text "Board post was successfully created"
    click_on "Back"
  end

  test "updating a Board post" do
    visit board_posts_url
    click_on "Edit", match: :first

    fill_in "Board", with: @board_post.board_id
    fill_in "Content", with: @board_post.content
    fill_in "Created at", with: @board_post.created_at
    fill_in "Updated at", with: @board_post.updated_at
    fill_in "User", with: @board_post.user_id
    click_on "Update Board post"

    assert_text "Board post was successfully updated"
    click_on "Back"
  end

  test "destroying a Board post" do
    visit board_posts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Board post was successfully destroyed"
  end
end
