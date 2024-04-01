require "test_helper"

class MediaTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @media_type = media_types(:one)
  end

  test "should get index" do
    get media_types_url
    assert_response :success
  end

  test "should get new" do
    get new_media_type_url
    assert_response :success
  end

  test "should create media_type" do
    assert_difference("MediaType.count") do
      post media_types_url, params: { media_type: { name: @media_type.name } }
    end

    assert_redirected_to media_type_url(MediaType.last)
  end

  test "should show media_type" do
    get media_type_url(@media_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_media_type_url(@media_type)
    assert_response :success
  end

  test "should update media_type" do
    patch media_type_url(@media_type), params: { media_type: { name: @media_type.name } }
    assert_redirected_to media_type_url(@media_type)
  end

  test "should destroy media_type" do
    assert_difference("MediaType.count", -1) do
      delete media_type_url(@media_type)
    end

    assert_redirected_to media_types_url
  end
end
