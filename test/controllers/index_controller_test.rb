require 'test_helper'

class IndexControllerTest < ActionDispatch::IntegrationTest
  test "should get invite" do
    get index_invite_url
    assert_response :success
  end

end
