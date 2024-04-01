require "application_system_test_case"

class PostTagsTest < ApplicationSystemTestCase
  setup do
    @post_tag = post_tags(:one)
  end

  test "visiting the index" do
    visit post_tags_url
    assert_selector "h1", text: "Post Tags"
  end

  test "creating a Post tag" do
    visit post_tags_url
    click_on "New Post Tag"

    fill_in "Post", with: @post_tag.post_id
    fill_in "Tag", with: @post_tag.tag_id
    click_on "Create Post tag"

    assert_text "Post tag was successfully created"
    click_on "Back"
  end

  test "updating a Post tag" do
    visit post_tags_url
    click_on "Edit", match: :first

    fill_in "Post", with: @post_tag.post_id
    fill_in "Tag", with: @post_tag.tag_id
    click_on "Update Post tag"

    assert_text "Post tag was successfully updated"
    click_on "Back"
  end

  test "destroying a Post tag" do
    visit post_tags_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Post tag was successfully destroyed"
  end
end
