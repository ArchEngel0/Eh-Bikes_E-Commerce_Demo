require "test_helper"

class ContactPagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contact_page = contact_pages(:one)
  end

  test "should get index" do
    get contact_pages_url
    assert_response :success
  end

  test "should get new" do
    get new_contact_page_url
    assert_response :success
  end

  test "should create contact_page" do
    assert_difference("ContactPage.count") do
      post contact_pages_url, params: { contact_page: { content: @contact_page.content, title: @contact_page.title } }
    end

    assert_redirected_to contact_page_url(ContactPage.last)
  end

  test "should show contact_page" do
    get contact_page_url(@contact_page)
    assert_response :success
  end

  test "should get edit" do
    get edit_contact_page_url(@contact_page)
    assert_response :success
  end

  test "should update contact_page" do
    patch contact_page_url(@contact_page), params: { contact_page: { content: @contact_page.content, title: @contact_page.title } }
    assert_redirected_to contact_page_url(@contact_page)
  end

  test "should destroy contact_page" do
    assert_difference("ContactPage.count", -1) do
      delete contact_page_url(@contact_page)
    end

    assert_redirected_to contact_pages_url
  end
end
