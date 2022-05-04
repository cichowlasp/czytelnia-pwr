require "application_system_test_case"

class UserDataTest < ApplicationSystemTestCase
  setup do
    @user_datum = user_data(:one)
  end

  test "visiting the index" do
    visit user_data_url
    assert_selector "h1", text: "User data"
  end

  test "should create user datum" do
    visit user_data_url
    click_on "New user datum"

    fill_in "Country", with: @user_datum.country
    fill_in "Department", with: @user_datum.department
    fill_in "Field of study", with: @user_datum.field_of_study
    fill_in "Name", with: @user_datum.name
    fill_in "Surname", with: @user_datum.surname
    fill_in "University", with: @user_datum.university
    fill_in "User", with: @user_datum.user_id
    click_on "Create User datum"

    assert_text "User datum was successfully created"
    click_on "Back"
  end

  test "should update User datum" do
    visit user_datum_url(@user_datum)
    click_on "Edit this user datum", match: :first

    fill_in "Country", with: @user_datum.country
    fill_in "Department", with: @user_datum.department
    fill_in "Field of study", with: @user_datum.field_of_study
    fill_in "Name", with: @user_datum.name
    fill_in "Surname", with: @user_datum.surname
    fill_in "University", with: @user_datum.university
    fill_in "User", with: @user_datum.user_id
    click_on "Update User datum"

    assert_text "User datum was successfully updated"
    click_on "Back"
  end

  test "should destroy User datum" do
    visit user_datum_url(@user_datum)
    click_on "Destroy this user datum", match: :first

    assert_text "User datum was successfully destroyed"
  end
end
