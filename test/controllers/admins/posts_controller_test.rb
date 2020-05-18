require 'test_helper'

class Admins::PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get list" do
    get admins_posts_list_url
    assert_response :success
  end

  test "should get show" do
    get admins_posts_show_url
    assert_response :success
  end

end
