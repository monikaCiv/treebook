require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "a user should enter a first name" do
  	user = User.new
  	assert !user.save #dont save user in database
  	assert !user.errors[:first_name].empty? #errori na oovom filedu nisu prazni
  end 

  test "a user should enter a last name" do
  	user = User.new
  	assert !user.save #dont save user in database
  	assert !user.errors[:last_name].empty? #errori na oovom filedu nisu prazni
  end 

  test "a user should enter a profile name" do
  	user = User.new
  	assert !user.save #dont save user in database
  	assert !user.errors[:profile_name].empty? #errori na oovom filedu nisu prazni
  end 

  test "a user should have a unique profile name" do
  	user = User.new
  	user.profile_name = users(:monika).profile_name
  	#user.email = "monika.civic@etfos.hr"
  	#user.first_name = "Monika"
  	#user.last_name = "Čivić"
  	#user.password = "123456"
  	#user.password_confirmation = "123456"
  	
  	#users(:monika)

  	assert !user.save
  	assert !users.errors[:profile_name].empty?
  end

  test "a user should have a profile name without spaces" do
  	user = User.new
  	user.profile_name = "My Profile With Spaces"

  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  	essert user.errors[:profile_name].include?("Must be formatted correctly.")
   end 

end
