require "test_helper"

class OrganizerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get organizer_index_url
    assert_response :success
  end
end
