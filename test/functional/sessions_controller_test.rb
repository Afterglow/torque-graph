require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get sensor" do
    get :sensor
    assert_response :success
  end

end
