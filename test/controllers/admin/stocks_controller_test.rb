require "test_helper"

class Admin::StocksControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_stocks_new_url
    assert_response :success
  end

  test "should get show" do
    get admin_stocks_show_url
    assert_response :success
  end

  test "should get index" do
    get admin_stocks_index_url
    assert_response :success
  end
end
