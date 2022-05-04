require "application_system_test_case"

class SubscryptionsTest < ApplicationSystemTestCase
  setup do
    @subscryption = subscryptions(:one)
  end

  test "visiting the index" do
    visit subscryptions_url
    assert_selector "h1", text: "Subscryptions"
  end

  test "should create subscryption" do
    visit subscryptions_url
    click_on "New subscryption"

    fill_in "Level", with: @subscryption.level
    fill_in "Library", with: @subscryption.library_id
    fill_in "Price", with: @subscryption.price
    click_on "Create Subscryption"

    assert_text "Subscryption was successfully created"
    click_on "Back"
  end

  test "should update Subscryption" do
    visit subscryption_url(@subscryption)
    click_on "Edit this subscryption", match: :first

    fill_in "Level", with: @subscryption.level
    fill_in "Library", with: @subscryption.library_id
    fill_in "Price", with: @subscryption.price
    click_on "Update Subscryption"

    assert_text "Subscryption was successfully updated"
    click_on "Back"
  end

  test "should destroy Subscryption" do
    visit subscryption_url(@subscryption)
    click_on "Destroy this subscryption", match: :first

    assert_text "Subscryption was successfully destroyed"
  end
end
