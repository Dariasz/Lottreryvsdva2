require 'test_helper'

class MyitemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get myitems_index_url
    assert_response :success
  end

end
