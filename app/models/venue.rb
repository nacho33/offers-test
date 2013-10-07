class Venue < ActiveRecord::Base
    attr_accessible :venue_name, :address, :description, :latitude, :longitude, :contact_name, :contact_number

    has_many :offers, dependent: :destroy
  	has_many :users_venues, dependent: :delete_all
  	has_many :users, :through => :users_venues

  	validates_presence_of :venue_name

end
