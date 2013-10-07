# encoding: UTF-8
require_relative '../spec_helper'

describe "Create venues"  do

	it "Can create a venue" do
		venue = FactoryGirl.create(:venue)
		venue.id.should_not be_nil
		venue.users.should_not be_empty
	end

	it "Can not create an empty venue" do
		exception = assert_raise(ActiveRecord::RecordInvalid){FactoryGirl.create(:empty_venue)}
	end
	it "Can not create without venue_name" do
		exception = assert_raise(ActiveRecord::RecordInvalid){FactoryGirl.create(:venue, venue_name: nil)}
	 	assert_equal("Validation failed: Venue name can't be blank", exception.message)
	end

end

describe "Destroy venue" do

	

end
