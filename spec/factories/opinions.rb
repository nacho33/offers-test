require 'factory_girl'

FactoryGirl.define  do

	factory :opinion do 
		title 'the offer title'
	    description "the offer description"
	    points 5
	end

	factory :empty_opinion, class: 'Opinion' do 
		
	end

	
end