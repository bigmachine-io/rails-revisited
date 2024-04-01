require "application_system_test_case"

class MediaTypesTest < ApplicationSystemTestCase
  setup do
    @media_type = media_types(:one)
  end

  test "visiting the index" do
    visit media_types_url
    assert_selector "h1", text: "Media types"
  end

  test "should create media type" do
    visit media_types_url
    click_on "New media type"

    fill_in "Name", with: @media_type.name
    click_on "Create Media type"

    assert_text "Media type was successfully created"
    click_on "Back"
  end

  test "should update Media type" do
    visit media_type_url(@media_type)
    click_on "Edit this media type", match: :first

    fill_in "Name", with: @media_type.name
    click_on "Update Media type"

    assert_text "Media type was successfully updated"
    click_on "Back"
  end

  test "should destroy Media type" do
    visit media_type_url(@media_type)
    click_on "Destroy this media type", match: :first

    assert_text "Media type was successfully destroyed"
  end
end
