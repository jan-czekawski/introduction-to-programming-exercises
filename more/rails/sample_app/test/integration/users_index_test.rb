require 'test_helper'

class UsersIndexTest < ActionDispatch::IntegrationTest
  
  def setup
    @admin = users(:jerry)
    @not_admin = users(:george) 
  end
  
  test "index including pagination" do
    log_in_as(@admin)
    get users_path
    assert_template "users/index"
    # assert_select "div.pagination", count: 2 # fails after #where(activated)
    User.where(activated: true).paginate(page: 1).each do |user|
      assert_select "a[href=?]", user_path(user), text: user.name
    end
  end
  
  test "index as admin including pagination and delete links" do
    log_in_as(@admin)
    get users_path
    assert_template "users/index"
    # assert_select "div.pagination", count: 2 # fails after #where(activated: true)
    first_page_of_users = User.where(activated: true).paginate(page: 1)
    first_page_of_users.each do |user|
      assert_select "a[href=?]", user_path(user), text: user.name
      unless user == @admin
        assert_select "a[href=?]", user_path(user), text: "delete"
      end
    end
    assert_difference "User.count", -1 do
      delete user_path(@not_admin)
    end
  end
  
  test "index as non-admin" do
    log_in_as(@not_admin)
    get users_path
    assert_select "a", text: "delete", count: 0
  end
end
