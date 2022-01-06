require "test_helper"

class VendasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get vendas_index_url
    assert_response :success
  end
end
