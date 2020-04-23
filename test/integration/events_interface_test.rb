require 'test_helper'

class EventsInterfaceTest < ActionDispatch::IntegrationTest

	def setup
		@user = users(:michael)
	end
	
	test "event interface" do
		log_in_as(@user)
		get root_path
		assert_select 'div.pagination'
		
		#Invalid submission
		assert_no_difference 'Event.count' do
			post events_path, params: { event: {content: "" }}
		end
		assert_select 'div#error_explanation'
		
		#Valid submission
		content = "Dinner theater showing of Grease"
		starts = Time.now
		assert_difference 'Event.count', 1 do
			post events_path, params: {event: {content: content, starts: starts }}
		end
		assert_redirected_to root_url
		follow_redirect!
		assert_match content, response.body
		
		#Delete an event
		assert_select 'a', text: 'delete'
		first_event = @user.events.paginate(page: 1).first
		assert_difference 'Event.count', -1 do
			delete event_path(first_event)
		end
		
		#Visit different user should have no delete links
		get user_path(users(:archer))
		assert_select 'a', text: 'delete', count: 0
	end

end
