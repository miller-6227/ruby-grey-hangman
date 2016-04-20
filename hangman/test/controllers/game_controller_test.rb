require 'test_helper'

class GameControllerTest < ActionController::TestCase
  test "should get gameplay" do
    get :gameplay
    assert_response :success
  end

end
