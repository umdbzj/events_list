require 'test_helper'

class UsersProfileTest < ActionDispatch::IntegrationTest
	include ApplicationHelper
	
	def setup
		@user = users(:michael)   # from users.yml
	end
	
	test "profile display" do
		get user_path(@user)
		assert_template 'users/show'
		assert_select 'title', full_title(@user.name)
		assert_select 'h1', text: @user.name
		assert_select 'h1>img.gravatar'
		assert_match @user.events.count.to_s, response.body
		assert_select 'div.pagination'
		@user.events.paginate(page: 1).each do |event|
			assert_match event.content, response.body
		end
	end
end
