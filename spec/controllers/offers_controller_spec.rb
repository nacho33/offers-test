require 'spec_helper'
describe OffersController do

  def valid_attributes
    {  }
  end

  
  def valid_session
    {}
  end

 	before(:each) do
      	@user_venue = FactoryGirl.create(:user_venue)
      	@user = FactoryGirl.create(:user)
      	@admin = FactoryGirl.create(:user_admin)
      	@venue = FactoryGirl.create(:venue)
      	@offer = FactoryGirl.create(:offer, venue_id: @venue.id)

    end  	

    describe "GET index" do
    	it "without logged user" do
	      get :index, {}, valid_session
	      response.should redirect_to(root_url)
	    end

	    it "without logged user" do
	      login(@user)
	      get :index, {}, valid_session
	      response.should be_success
	    end

	    it "without logged user venue" do
	      login(@user_venue)
	      get :index, {}, valid_session
	      response.should be_success
	    end

	    it "without logged admin" do
	      login(@admin)
	      get :index, {}, valid_session
	      response.should be_success
	    end
    end

    

end