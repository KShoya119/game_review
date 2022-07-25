require "test_helper"

class Customer::CustomersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get customer_customers_show_url
    assert_response :success
  end
end
