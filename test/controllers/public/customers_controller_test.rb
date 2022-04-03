require "test_helper"

class Public::CustomersControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get public_customers_edit_url
    assert_response :success
  end

  test "should get show" do
    get public_customers_show_url
    assert_response :success
  end

  test "should get unsubsrib" do
    get public_customers_unsubsrib_url
    assert_response :success
  end

  test "should get witdraw" do
    get public_customers_witdraw_url
    assert_response :success
  end
end
