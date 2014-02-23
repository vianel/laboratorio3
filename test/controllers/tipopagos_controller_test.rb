require 'test_helper'

class TipopagosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
