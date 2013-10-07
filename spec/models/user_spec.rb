# encoding: UTF-8
require_relative '../spec_helper'

describe "Create users"  do

	it "Can an user" do
		user = FactoryGirl.create(:user)
		user.id.should_not be_nil
		user.role.should eq('user')

		user_venue = FactoryGirl.create(:user_venue)
		user_venue.id.should_not be_nil
		user_venue.role.should eq('venue')

		admin = FactoryGirl.create(:user_admin)
		admin.id.should_not be_nil
		admin.role.should eq('admin')
	end

	it "Can not create an user without wrong email" do
		exception = assert_raise(ActiveRecord::RecordInvalid){FactoryGirl.create(:user, email: 'aaa.es')}
	 	assert_equal("Validation failed: Email is invalid", exception.message)
	end

	it "Can not create an user without a password but with email" do
		exception = assert_raise(ActiveRecord::RecordInvalid){FactoryGirl.create(:empty_user, email: 'aa@a.es')}
	 	assert_equal("Validation failed: Password can't be blank", exception.message)
	end

	it "Can not create an user without email but with password" do
		exception = assert_raise(ActiveRecord::RecordInvalid){FactoryGirl.create(:empty_user, password: '000000')}
	 	assert_equal("Validation failed: Email can't be blank, Email is invalid", exception.message)
	end

	it "Can create an user with email and password" do
		user = FactoryGirl.create(:empty_user, email: 'a@a.es', password: '000000')
		user.id.should_not be_nil
		user.role.should eq('user')
		user.username.should eq('default')
	end

	it "Can not create two users with the same email" do
		user = FactoryGirl.create(:user)
		exception = assert_raise(ActiveRecord::RecordInvalid){FactoryGirl.create(:user_venue, email: user.email)}
		assert_equal("Validation failed: Email has already been taken, Email has already been taken", exception.message)

	end

end

describe "Destroy users" do
	it 'destroy user' do
		user = FactoryGirl.create(:user)
		user.destroy
		User.where(id: user.id).first.should be_nil
	end
end