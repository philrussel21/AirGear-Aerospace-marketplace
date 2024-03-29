require "application_system_test_case"

class ProfilesTest < ApplicationSystemTestCase
  setup do
    @profile = profiles(:one)
  end

  test "visiting the index" do
    visit profiles_url
    assert_selector "h1", text: "Profiles"
  end

  test "creating a Profile" do
    visit profiles_url
    click_on "New Profile"

    fill_in "Contact", with: @profile.contact
    fill_in "Country", with: @profile.country
    fill_in "Postcode", with: @profile.postcode
    fill_in "State", with: @profile.state
    fill_in "Street", with: @profile.street
    fill_in "Suburb", with: @profile.suburb
    fill_in "Website", with: @profile.website
    click_on "Create Profile"

    assert_text "Profile was successfully created"
    click_on "Back"
  end

  test "updating a Profile" do
    visit profiles_url
    click_on "Edit", match: :first

    fill_in "Contact", with: @profile.contact
    fill_in "Country", with: @profile.country
    fill_in "Postcode", with: @profile.postcode
    fill_in "State", with: @profile.state
    fill_in "Street", with: @profile.street
    fill_in "Suburb", with: @profile.suburb
    fill_in "Website", with: @profile.website
    click_on "Update Profile"

    assert_text "Profile was successfully updated"
    click_on "Back"
  end

  test "destroying a Profile" do
    visit profiles_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Profile was successfully destroyed"
  end
end
