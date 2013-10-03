class Offer < ActiveRecord::Base
	attr_accessible :price, :description, :city, :points, :start_date, :finish_date, :offer_type, :number, :venue_id, :title, :photo

	has_many :opinions
	belongs_to :venue

	has_attached_file :photo, :styles => { :small => "200x200>" },
                  :url  => "/assets/offers/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/offers/:id/:style/:basename.:extension"

	validates_attachment_presence :photo
	validates_attachment_size :photo, :less_than => 2.megabytes
	validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']

	def empty_image_path
     "/system/assets/empty.jpg"
  	end

  	def user_owns_offer?(offer)
  		puts 'user_owns_offer'
  		venue = Venue.find(offer.venue_id)
  		if venue
  			return user_owns_venue?(venue)
  		else
  			return false
  		end
  	end
end
