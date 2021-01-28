require "test_helper"

class EventvenuesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @eventvenue = eventvenues(:one)
  end

  test "should get index" do
    get eventvenues_url
    assert_response :success
  end

  test "should get new" do
    get new_eventvenue_url
    assert_response :success
  end

  test "should create eventvenue" do
    assert_difference('Eventvenue.count') do
      post eventvenues_url, params: { eventvenue: { date: @eventvenue.date, description: @eventvenue.description } }
    end

    assert_redirected_to eventvenue_url(Eventvenue.last)
  end

  test "should show eventvenue" do
    get eventvenue_url(@eventvenue)
    assert_response :success
  end

  test "should get edit" do
    get edit_eventvenue_url(@eventvenue)
    assert_response :success
  end

  test "should update eventvenue" do
    patch eventvenue_url(@eventvenue), params: { eventvenue: { date: @eventvenue.date, description: @eventvenue.description } }
    assert_redirected_to eventvenue_url(@eventvenue)
  end

  test "should destroy eventvenue" do
    assert_difference('Eventvenue.count', -1) do
      delete eventvenue_url(@eventvenue)
    end

    assert_redirected_to eventvenues_url
  end
end
