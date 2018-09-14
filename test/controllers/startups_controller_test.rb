require 'test_helper'

class StartupsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get startups_index_url
    assert_response :success
  end

  test "should get update" do
    get startups_update_url
    assert_response :success
  end

end
