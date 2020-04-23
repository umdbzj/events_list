require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest

	def setup
		@event = events(:orange)
	end
	
	test "should redirect create when not logged in" do
		assert_no_difference 'Event.count' do
			post events_path, params: {event: {content: "Lorem ipsum" }}
		end
		assert_redirected_to login_url
	end
	
	test "should redirect destroy when not logged in" do
		assert_no_difference 'Event.count' do
			delete event_path(@event)
		end
		assert_redirected_to login_url
	end
	
	test "should redirect destroy for wrong micropost" do
		log_in_as(users(:michael))
		event = events(:ants)
		assert_no_difference 'Event.count' do
			delete event_path(event)
		end
		assert_redirected_to root_url
	end
end
