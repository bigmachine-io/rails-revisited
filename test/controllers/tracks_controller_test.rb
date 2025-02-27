require "test_helper"

class TracksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @track = tracks(:one)
  end

  test "should get index" do
    get tracks_url
    assert_response :success
  end

  test "should get new" do
    get new_track_url
    assert_response :success
  end

  test "should create track" do
    assert_difference("Track.count") do
      post tracks_url, params: { track: { album_id: @track.album_id, bytes: @track.bytes, composer: @track.composer, genre_id: @track.genre_id, media_type_id: @track.media_type_id, milliseconds: @track.milliseconds, name: @track.name, unit_price: @track.unit_price } }
    end

    assert_redirected_to track_url(Track.last)
  end

  test "should show track" do
    get track_url(@track)
    assert_response :success
  end

  test "should get edit" do
    get edit_track_url(@track)
    assert_response :success
  end

  test "should update track" do
    patch track_url(@track), params: { track: { album_id: @track.album_id, bytes: @track.bytes, composer: @track.composer, genre_id: @track.genre_id, media_type_id: @track.media_type_id, milliseconds: @track.milliseconds, name: @track.name, unit_price: @track.unit_price } }
    assert_redirected_to track_url(@track)
  end

  test "should destroy track" do
    assert_difference("Track.count", -1) do
      delete track_url(@track)
    end

    assert_redirected_to tracks_url
  end
end
