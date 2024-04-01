require "application_system_test_case"

class GroupMessagesTest < ApplicationSystemTestCase
  setup do
    @group_message = group_messages(:one)
  end

  test "visiting the index" do
    visit group_messages_url
    assert_selector "h1", text: "Group Messages"
  end

  test "creating a Group message" do
    visit group_messages_url
    click_on "New Group Message"

    fill_in "Content", with: @group_message.content
    fill_in "Group", with: @group_message.group_id
    fill_in "Sent at", with: @group_message.sent_at
    fill_in "User", with: @group_message.user_id
    click_on "Create Group message"

    assert_text "Group message was successfully created"
    click_on "Back"
  end

  test "updating a Group message" do
    visit group_messages_url
    click_on "Edit", match: :first

    fill_in "Content", with: @group_message.content
    fill_in "Group", with: @group_message.group_id
    fill_in "Sent at", with: @group_message.sent_at
    fill_in "User", with: @group_message.user_id
    click_on "Update Group message"

    assert_text "Group message was successfully updated"
    click_on "Back"
  end

  test "destroying a Group message" do
    visit group_messages_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Group message was successfully destroyed"
  end
end
