require "test_helper"

class Admin::OrderDetailControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get admin_order_detail_show_url
    assert_response :success
  end
end
