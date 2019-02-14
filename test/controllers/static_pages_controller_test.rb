require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  test "should get home" do
    get root_path
    assert_response :success
    assert_select "title", "Blog App"
  end

  test "should get help" do
    get help_path
    assert_response :success
    assert_select "title", "Help | Blog App"
  end

  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", "About | Blog App"
  end

  test "should get articles" do
    get articles_url
    assert_response :success
    assert_select "title", "Articles | Blog App"
  end
end
