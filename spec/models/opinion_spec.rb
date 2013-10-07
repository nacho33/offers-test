# encoding: UTF-8
require_relative '../spec_helper'

describe "Create opinions"  do

	it "Can create an offer with an offer" do
		user = FactoryGirl.create(:user)
		venue = FactoryGirl.create(:venue)
		offer = FactoryGirl.create(:offer, venue_id: venue.id)
		opinion = FactoryGirl.create(:opinion, offer_id: offer.id, user_id: user.id)
		opinion.id.should_not be_nil
	end

	it "Can not create an opinion without an offer" do
		user = FactoryGirl.create(:user)
		exception = assert_raise(ActiveRecord::RecordInvalid){FactoryGirl.create(:opinion, user_id: user.id)}
	end
	it "Can not create an opinion without an user" do
		venue = FactoryGirl.create(:venue)
		offer = FactoryGirl.create(:offer, venue_id: venue.id)
		exception = assert_raise(ActiveRecord::RecordInvalid){FactoryGirl.create(:opinion, offer_id: offer.id)}
	end
	it "Can not create an empty opinion even with an offer and a venue" do
		user = FactoryGirl.create(:user)
		venue = FactoryGirl.create(:venue)
		offer = FactoryGirl.create(:offer, venue_id: venue.id)
		exception = assert_raise(ActiveRecord::RecordInvalid){FactoryGirl.create(:empty_opinion, offer_id: offer.id, user_id: user.id)}
	end

	

end

describe "Destroy offers" do
	before (:each) do
		@user = FactoryGirl.create(:user)
		@venue = FactoryGirl.create(:venue)
		@offer = FactoryGirl.create(:offer, venue_id: @venue.id)
		@opinion = FactoryGirl.create(:opinion, offer_id: @offer.id, user_id: @user.id)
	end

	it 'when we destroy an offer we destroy its opinions' do
		@offer.destroy
		Offer.where(id: @offer.id).first.should be_nil
		Opinion.where(id: @opinion.id).first.should be_nil
	end
	
	it 'when we destroy a venue we destroy its offers and opinions' do
		@venue.destroy

		Venue.where(id: @venue.id).first.should be_nil
		Offer.where(id: @offer.id).first.should be_nil
		Opinion.where(id: @opinion.id).first.should be_nil
	end

	it 'when we destroy an user we destroy its opinions' do
		@user.destroy
		Offer.where(id: @offer.id).first.should_not be_nil
		Opinion.where(id: @opinion.id).first.should be_nil
	end

	it 'when we destroy the user of the venue we destroy everything' do
		
		user = @venue.users.first

		user.destroy
		Venue.where(id: @venue.id).first.should be_nil
		Offer.where(id: @offer.id).first.should be_nil
		Opinion.where(id: @opinion.id).first.should be_nil
	end

end