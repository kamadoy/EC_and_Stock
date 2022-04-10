require "test_helper"

class Admin::StocksControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_stocks_new_url
    assert_response :success
  end

  test "should get edit" do
    get admin_stocks_edit_url
    assert_response :success
  end
end
