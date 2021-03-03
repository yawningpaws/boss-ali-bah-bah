require "test_helper"

class WorkdaysControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get workdays_new_url
    assert_response :success
  end

  test "should get create" do
    get workdays_create_url
    assert_response :success
  end

  test "should get edit" do
    get workdays_edit_url
    assert_response :success
  end

  test "should get update" do
    get workdays_update_url
    assert_response :success
  end
end
