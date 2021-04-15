require 'test_helper'

class ItemImagesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get item_images_show_url
    assert_response :success
  end

end
