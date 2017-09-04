require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:jerry)
  end
  
  test "unsuccessful edits" do
    log_in_as @user
    get edit_user_path(@user)
    assert_template "users/edit"
    patch user_path(@user), params: { user: { name: "",
                                              email: "foo@invalid",
                                              password: "password",
                                              password_confirmation: "password" } }
    assert_template "users/edit"
    assert_select "div.alert", "The form contains 2 errors."
    assert_select "div#error_explanation ul li", count: 2
  end
  
  test "successful edit with friendly forwarding (only one)" do
    get edit_user_path(@user)
    log_in_as(@user)
    assert_redirected_to edit_user_url(@user)
    name = "Foo Bar"
    email = "foo@bar.com"
    patch user_path(@user), params: { user: { name: name,
                                              email: email,
                                              password: "",
                                              password_confirmation: "" } }
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert_equal name, @user.name
    assert_equal email, @user.email
    delete logout_path
    assert_not is_logged_in?
    get login_path
    log_in_as(@user)
    assert_redirected_to @user
  end
  
  
end
