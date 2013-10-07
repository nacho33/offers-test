require 'factory_girl'

FactoryGirl.define  do

	factory :venue do
      	sequence(:venue_name) { |i| "venue_name_#{i}"}
	    description   "the venue description"
	    address   "Gran via 24"
	    longitude   14.5
	    latitude   12.5
	    after :create do |venue|
		    venue.users << FactoryGirl.create(:user)
		end
	end

	factory :empty_venue, class: 'Venue'  do 	    
	end

	# factory :users_venue do
	#     user
	#     venue
	# end
	# factory :users_venue do |i|
 #      i.association :user
 #      i.association :venue
 #    end
 #    factory :users_venue do
	#     association :user
	#     association :venue
	# end


end