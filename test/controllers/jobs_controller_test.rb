require 'test_helper'

class JobsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get jobs_url
    assert_response :success
  end

  test 'should get new' do
    get new_job_url
    assert_response :success
  end
end
