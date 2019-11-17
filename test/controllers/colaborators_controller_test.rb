require 'test_helper'

class ColaboratorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @colaborator = colaborators(:one)
  end

  test "should get index" do
    get colaborators_url, as: :json
    assert_response :success
  end

  test "should create colaborator" do
    assert_difference('Colaborator.count') do
      post colaborators_url, params: { colaborator: { direccion: @colaborator.direccion, name: @colaborator.name } }, as: :json
    end

    assert_response 201
  end

  test "should show colaborator" do
    get colaborator_url(@colaborator), as: :json
    assert_response :success
  end

  test "should update colaborator" do
    patch colaborator_url(@colaborator), params: { colaborator: { direccion: @colaborator.direccion, name: @colaborator.name } }, as: :json
    assert_response 200
  end

  test "should destroy colaborator" do
    assert_difference('Colaborator.count', -1) do
      delete colaborator_url(@colaborator), as: :json
    end

    assert_response 204
  end
end
