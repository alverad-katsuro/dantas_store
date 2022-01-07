require "test_helper"

class CobrancaControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cobranca_index_url
    assert_response :success
  end
end
