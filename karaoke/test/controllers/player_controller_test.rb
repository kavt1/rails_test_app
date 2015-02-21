require 'test_helper'

class PlayerControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get audioplayer" do
    get :audioplayer
    assert_response :success
  end

  test "should get videoplayer" do
    get :videoplayer
    assert_response :success
  end

end
