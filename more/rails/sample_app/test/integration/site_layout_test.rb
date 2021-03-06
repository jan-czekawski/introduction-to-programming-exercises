require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:george)
  end
  
  test "layout_links" do
    get root_path
    assert_template "static_pages/home"
    assert_not is_logged_in?
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
    assert_select "a[href=?]", signup_path
    assert_select "a[href=?]", users_path, count: 0
    assert_select "a[href=?]", login_path, count: 1
    assert_select "a[href=?]", logout_path, count: 0
    assert_select "a[href=?]", edit_user_path(@user), count: 0
    assert_select "a[href=?]", user_path(@user), count: 0
    get login_path
    log_in_as @user
    assert_redirected_to @user
    get root_url
    assert is_logged_in?
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
    assert_select "a[href=?]", signup_path, count: 0
    assert_select "a[href=?]", users_path, count: 1
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", logout_path, count: 1
    assert_select "a[href=?]", edit_user_path(@user), count: 1
    assert_select "a[href=?]", user_path(@user)
    get contact_path
    assert_select "title", full_title("Contact")
    get about_path
    assert_select "title", full_title("About")
  end
end
