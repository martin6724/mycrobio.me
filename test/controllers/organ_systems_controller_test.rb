require 'test_helper'

class OrganSystemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get organ_systems_index_url
    assert_response :success
  end

  test "should get show" do
    get organ_systems_show_url
    assert_response :success
  end

  test "should get create" do
    get organ_systems_create_url
    assert_response :success
  end

end
