require 'test_helper'

class CustomTestTest < ActionDispatch::IntegrationTest

	test "that /login route opens the login page" do
		get '/login'
		assert_response :success #osigurati da je ono prošlo
	end

	test "that /logout route opens the log out page" do
		get '/logout'
		assert_response :redirect #osigurati da je ono prošlo
		assert_redirected_to '/'
	end

		test "that /register route opens the sign up page" do
		get '/register'
		assert_response :success #osigurati da je ono prošlo'
	end


end
