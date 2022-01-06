require "test_helper"

class CategoriaControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get categoria_show_url
    assert_response :success
  end
end
