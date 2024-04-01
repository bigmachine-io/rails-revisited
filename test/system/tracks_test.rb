require "application_system_test_case"

class TracksTest < ApplicationSystemTestCase
  setup do
    @track = tracks(:one)
  end

  test "visiting the index" do
    visit tracks_url
    assert_selector "h1", text: "Tracks"
  end

  test "should create track" do
    visit tracks_url
    click_on "New track"

    fill_in "Album", with: @track.album_id
    fill_in "Bytes", with: @track.bytes
    fill_in "Composer", with: @track.composer
    fill_in "Genre", with: @track.genre_id
    fill_in "Media type", with: @track.media_type_id
    fill_in "Milliseconds", with: @track.milliseconds
    fill_in "Name", with: @track.name
    fill_in "Unit price", with: @track.unit_price
    click_on "Create Track"

    assert_text "Track was successfully created"
    click_on "Back"
  end

  test "should update Track" do
    visit track_url(@track)
    click_on "Edit this track", match: :first

    fill_in "Album", with: @track.album_id
    fill_in "Bytes", with: @track.bytes
    fill_in "Composer", with: @track.composer
    fill_in "Genre", with: @track.genre_id
    fill_in "Media type", with: @track.media_type_id
    fill_in "Milliseconds", with: @track.milliseconds
    fill_in "Name", with: @track.name
    fill_in "Unit price", with: @track.unit_price
    click_on "Update Track"

    assert_text "Track was successfully updated"
    click_on "Back"
  end

  test "should destroy Track" do
    visit track_url(@track)
    click_on "Destroy this track", match: :first

    assert_text "Track was successfully destroyed"
  end
end
