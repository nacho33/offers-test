# encoding: UTF-8
require_relative '../spec_helper'

describe "Create offers"  do

	it "Can create an offer with a venue" do
		venue = FactoryGirl.create(:venue)
		offer = FactoryGirl.create(:offer, venue_id: venue.id)
		offer.id.should_not be_nil
	end

	it "Can not create an offer without a venue" do
		exception = assert_raise(ActiveRecord::RecordInvalid){FactoryGirl.create(:offer)}
	end
	it "Can not create an empty offer even with a venue" do
		venue = FactoryGirl.create(:venue)
		exception = assert_raise(ActiveRecord::RecordInvalid){FactoryGirl.create(:empty_offer, venue_id: venue.id)}
	end

	it "Can not create an empty offer with photo even with a venue" do
		venue = FactoryGirl.create(:venue)
		exception = assert_raise(ActiveRecord::RecordInvalid){FactoryGirl.create(:empty_offer_with_photo, venue_id: venue.id)}
	end

end

describe "Destroy offers" do

	

end
