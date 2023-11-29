require "application_system_test_case"

class ProductPriceHistoriesTest < ApplicationSystemTestCase
  setup do
    @product_price_history = product_price_histories(:one)
  end

  test "visiting the index" do
    visit product_price_histories_url
    assert_selector "h1", text: "Product price histories"
  end

  test "should create product price history" do
    visit product_price_histories_url
    click_on "New product price history"

    fill_in "Effective date", with: @product_price_history.effective_date
    fill_in "Price", with: @product_price_history.price
    fill_in "Product", with: @product_price_history.product_id
    click_on "Create Product price history"

    assert_text "Product price history was successfully created"
    click_on "Back"
  end

  test "should update Product price history" do
    visit product_price_history_url(@product_price_history)
    click_on "Edit this product price history", match: :first

    fill_in "Effective date", with: @product_price_history.effective_date
    fill_in "Price", with: @product_price_history.price
    fill_in "Product", with: @product_price_history.product_id
    click_on "Update Product price history"

    assert_text "Product price history was successfully updated"
    click_on "Back"
  end

  test "should destroy Product price history" do
    visit product_price_history_url(@product_price_history)
    click_on "Destroy this product price history", match: :first

    assert_text "Product price history was successfully destroyed"
  end
end
