require 'test_helper'

class DisplayControllerTest < ActionController::TestCase
  test "should get display_users" do
    get :display_users
    assert_response :success
  end

  test "should get display_reviews" do
    get :display_reviews
    assert_response :success
  end

  test "should get display_books" do
    get :display_books
    assert_response :success
  end

end
