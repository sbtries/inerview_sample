require "test_helper"

class GroupControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get group_show_url
    assert_response :success
  end
end
