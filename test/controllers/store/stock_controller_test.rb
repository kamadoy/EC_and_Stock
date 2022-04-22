require "test_helper"

class Store::StockControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get store_stock_index_url
    assert_response :success
  end

  test "should get show" do
    get store_stock_show_url
    assert_response :success
  end
end
