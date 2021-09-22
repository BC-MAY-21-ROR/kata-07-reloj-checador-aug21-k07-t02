require "test_helper"

class RelojsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reloj = relojs(:one)
  end

  test "should get index" do
    get relojs_url, as: :json
    assert_response :success
  end

  test "should create reloj" do
    assert_difference('Reloj.count') do
      post relojs_url, params: { reloj: { name: @reloj.name } }, as: :json
    end

    assert_response 201
  end

  test "should show reloj" do
    get reloj_url(@reloj), as: :json
    assert_response :success
  end

  test "should update reloj" do
    patch reloj_url(@reloj), params: { reloj: { name: @reloj.name } }, as: :json
    assert_response 200
  end

  test "should destroy reloj" do
    assert_difference('Reloj.count', -1) do
      delete reloj_url(@reloj), as: :json
    end

    assert_response 204
  end
end
