require "test_helper"

class ProductPriceHistoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product_price_history = product_price_histories(:one)
  end

  test "should get index" do
    get product_price_histories_url
    assert_response :success
  end

  test "should get new" do
    get new_product_price_history_url
    assert_response :success
  end

  test "should create product_price_history" do
    assert_difference("ProductPriceHistory.count") do
      post product_price_histories_url, params: { product_price_history: { effective_date: @product_price_history.effective_date, price: @product_price_history.price, product_id: @product_price_history.product_id } }
    end

    assert_redirected_to product_price_history_url(ProductPriceHistory.last)
  end

  test "should show product_price_history" do
    get product_price_history_url(@product_price_history)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_price_history_url(@product_price_history)
    assert_response :success
  end

  test "should update product_price_history" do
    patch product_price_history_url(@product_price_history), params: { product_price_history: { effective_date: @product_price_history.effective_date, price: @product_price_history.price, product_id: @product_price_history.product_id } }
    assert_redirected_to product_price_history_url(@product_price_history)
  end

  test "should destroy product_price_history" do
    assert_difference("ProductPriceHistory.count", -1) do
      delete product_price_history_url(@product_price_history)
    end

    assert_redirected_to product_price_histories_url
  end
end
