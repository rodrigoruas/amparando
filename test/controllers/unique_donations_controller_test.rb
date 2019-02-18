require 'test_helper'

class UniqueDonationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get unique_donations_new_url
    assert_response :success
  end

end
