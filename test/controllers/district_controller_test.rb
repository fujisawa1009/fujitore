require 'test_helper'

class DistrictControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get district_show_url
    assert_response :success
  end

end
