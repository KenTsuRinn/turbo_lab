require "application_system_test_case"

class TwittersTest < ApplicationSystemTestCase
  setup do
    @twitter = twitters(:one)
  end

  test "visiting the index" do
    visit twitters_url
    assert_selector "h1", text: "Twitters"
  end

  test "creating a Twitter" do
    visit twitters_url
    click_on "New Twitter"

    fill_in "Content", with: @twitter.content
    fill_in "Dislike", with: @twitter.dislike
    fill_in "Like", with: @twitter.like
    fill_in "User", with: @twitter.user
    click_on "Create Twitter"

    assert_text "Twitter was successfully created"
    click_on "Back"
  end

  test "updating a Twitter" do
    visit twitters_url
    click_on "Edit", match: :first

    fill_in "Content", with: @twitter.content
    fill_in "Dislike", with: @twitter.dislike
    fill_in "Like", with: @twitter.like
    fill_in "User", with: @twitter.user
    click_on "Update Twitter"

    assert_text "Twitter was successfully updated"
    click_on "Back"
  end

  test "destroying a Twitter" do
    visit twitters_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Twitter was successfully destroyed"
  end
end
