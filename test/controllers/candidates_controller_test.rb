require 'test_helper'

class CandidatesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get candidates_index_url
    assert_response :success
  end

  test "should get invite" do
    get candidates_invite_url
    assert_response :success
  end

end
