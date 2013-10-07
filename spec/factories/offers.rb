require 'factory_girl'

FactoryGirl.define  do

	factory :offer do 
		title 'the offer title'
	    description "the offer description"
	    price 5
	    city 'Madrid'
        photo File.new(Rails.root + 'spec/fixtures/images/empty.jpg')

	end

	factory :empty_offer, class: 'Offer' do 
		
	end

	factory :empty_offer_with_photo, class: 'Offer' do 
        photo File.new(Rails.root + 'spec/fixtures/images/empty.jpg')		
	end


	
end