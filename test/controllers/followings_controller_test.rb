require 'test_helper'

class FollowingsControllerTest < ActionDispatch::IntegrationTest
  test "should get follow_user" do
    get followings_follow_user_url
    assert_response :success
  end

  test "should get follow_topic" do
    get followings_follow_topic_url
    assert_response :success
  end

end
