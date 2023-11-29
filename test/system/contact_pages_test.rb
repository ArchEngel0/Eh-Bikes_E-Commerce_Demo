require "application_system_test_case"

class ContactPagesTest < ApplicationSystemTestCase
  setup do
    @contact_page = contact_pages(:one)
  end

  test "visiting the index" do
    visit contact_pages_url
    assert_selector "h1", text: "Contact pages"
  end

  test "should create contact page" do
    visit contact_pages_url
    click_on "New contact page"

    fill_in "Content", with: @contact_page.content
    fill_in "Title", with: @contact_page.title
    click_on "Create Contact page"

    assert_text "Contact page was successfully created"
    click_on "Back"
  end

  test "should update Contact page" do
    visit contact_page_url(@contact_page)
    click_on "Edit this contact page", match: :first

    fill_in "Content", with: @contact_page.content
    fill_in "Title", with: @contact_page.title
    click_on "Update Contact page"

    assert_text "Contact page was successfully updated"
    click_on "Back"
  end

  test "should destroy Contact page" do
    visit contact_page_url(@contact_page)
    click_on "Destroy this contact page", match: :first

    assert_text "Contact page was successfully destroyed"
  end
end
