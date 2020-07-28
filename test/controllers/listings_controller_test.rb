require 'test_helper'

class ListingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @listing = listings(:one)
  end

  test "should get index" do
    get listings_url
    assert_response :success
  end

  test "should get new" do
    get new_listing_url
    assert_response :success
  end

  test "should create listing" do
    assert_difference('Listing.count') do
      post listings_url, params: { listing: { account_id: @listing.account_id, category_id: @listing.category_id, cert_date: @listing.cert_date, condition: @listing.condition, currency: @listing.currency, description: @listing.description, expiry_date: @listing.expiry_date, form_cert: @listing.form_cert, part_name: @listing.part_name, part_num: @listing.part_num, quantity: @listing.quantity, selling_price: @listing.selling_price, serial_num: @listing.serial_num } }
    end

    assert_redirected_to listing_url(Listing.last)
  end

  test "should show listing" do
    get listing_url(@listing)
    assert_response :success
  end

  test "should get edit" do
    get edit_listing_url(@listing)
    assert_response :success
  end

  test "should update listing" do
    patch listing_url(@listing), params: { listing: { account_id: @listing.account_id, category_id: @listing.category_id, cert_date: @listing.cert_date, condition: @listing.condition, currency: @listing.currency, description: @listing.description, expiry_date: @listing.expiry_date, form_cert: @listing.form_cert, part_name: @listing.part_name, part_num: @listing.part_num, quantity: @listing.quantity, selling_price: @listing.selling_price, serial_num: @listing.serial_num } }
    assert_redirected_to listing_url(@listing)
  end

  test "should destroy listing" do
    assert_difference('Listing.count', -1) do
      delete listing_url(@listing)
    end

    assert_redirected_to listings_url
  end
end
