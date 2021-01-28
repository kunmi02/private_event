require "application_system_test_case"

class EventvenuesTest < ApplicationSystemTestCase
  setup do
    @eventvenue = eventvenues(:one)
  end

  test "visiting the index" do
    visit eventvenues_url
    assert_selector "h1", text: "Eventvenues"
  end

  test "creating a Eventvenue" do
    visit eventvenues_url
    click_on "New Eventvenue"

    fill_in "Date", with: @eventvenue.date
    fill_in "Description", with: @eventvenue.description
    click_on "Create Eventvenue"

    assert_text "Eventvenue was successfully created"
    click_on "Back"
  end

  test "updating a Eventvenue" do
    visit eventvenues_url
    click_on "Edit", match: :first

    fill_in "Date", with: @eventvenue.date
    fill_in "Description", with: @eventvenue.description
    click_on "Update Eventvenue"

    assert_text "Eventvenue was successfully updated"
    click_on "Back"
  end

  test "destroying a Eventvenue" do
    visit eventvenues_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Eventvenue was successfully destroyed"
  end
end
