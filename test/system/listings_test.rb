require "application_system_test_case"

class ListingsTest < ApplicationSystemTestCase
  setup do
    @listing = listings(:one)
  end

  test "visiting the index" do
    visit listings_url
    assert_selector "h1", text: "Listings"
  end

  test "creating a Listing" do
    visit listings_url
    click_on "New Listing"

    fill_in "Account", with: @listing.account_id
    fill_in "Category", with: @listing.category_id
    fill_in "Cert date", with: @listing.cert_date
    fill_in "Condition", with: @listing.condition
    fill_in "Currency", with: @listing.currency
    fill_in "Description", with: @listing.description
    fill_in "Expiry date", with: @listing.expiry_date
    fill_in "Form cert", with: @listing.form_cert
    fill_in "Part name", with: @listing.part_name
    fill_in "Part num", with: @listing.part_num
    fill_in "Quantity", with: @listing.quantity
    fill_in "Selling price", with: @listing.selling_price
    fill_in "Serial num", with: @listing.serial_num
    click_on "Create Listing"

    assert_text "Listing was successfully created"
    click_on "Back"
  end

  test "updating a Listing" do
    visit listings_url
    click_on "Edit", match: :first

    fill_in "Account", with: @listing.account_id
    fill_in "Category", with: @listing.category_id
    fill_in "Cert date", with: @listing.cert_date
    fill_in "Condition", with: @listing.condition
    fill_in "Currency", with: @listing.currency
    fill_in "Description", with: @listing.description
    fill_in "Expiry date", with: @listing.expiry_date
    fill_in "Form cert", with: @listing.form_cert
    fill_in "Part name", with: @listing.part_name
    fill_in "Part num", with: @listing.part_num
    fill_in "Quantity", with: @listing.quantity
    fill_in "Selling price", with: @listing.selling_price
    fill_in "Serial num", with: @listing.serial_num
    click_on "Update Listing"

    assert_text "Listing was successfully updated"
    click_on "Back"
  end

  test "destroying a Listing" do
    visit listings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Listing was successfully destroyed"
  end
end
