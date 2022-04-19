require "test_helper"

class Public::StocksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_stocks_index_url
    assert_response :success
  end
end
