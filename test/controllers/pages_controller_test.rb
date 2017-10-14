require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get my_jobs" do
    get pages_my_jobs_url
    assert_response :success
  end

end
