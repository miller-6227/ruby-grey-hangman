require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get login" do
    get :login
    assert_response :success
  end

  test "should get game" do
    get :game
    assert_response :success
  end

end
