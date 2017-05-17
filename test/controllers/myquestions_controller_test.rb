require 'test_helper'

class MyquestionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get myquestions_index_url
    assert_response :success
  end

end
