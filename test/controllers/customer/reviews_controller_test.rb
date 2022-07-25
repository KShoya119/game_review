require "test_helper"

class Customer::ReviewsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get customer_reviews_index_url
    assert_response :success
  end

  test "should get new" do
    get customer_reviews_new_url
    assert_response :success
  end

  test "should get show" do
    get customer_reviews_show_url
    assert_response :success
  end
end
