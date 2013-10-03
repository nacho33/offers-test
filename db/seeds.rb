# encoding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

user = User.create(email: 'user@test.com', password: '000000',password_confirmation: '000000', username: 'user', role: 'user')
venue_user = User.create(email: 'venue@test.com', password: '000000', password_confirmation: '000000', username: 'venue', role: 'venue')
venue_user2 = User.create(email: 'venue2@test.com', password: '000000', password_confirmation: '000000', username: 'venue2', role: 'venue')
admin = User.create(email: 'admin@test.com', password: '000000', password_confirmation: '000000', username: 'admin', role: 'admin')


venue_user.venues.create(venue_name: 'Springfield Sol', address: 'Calle Montera, 2 Madrid', description: 'Shop at Springfield: jeans, jackets, dresses, trousers, shoes, accessories… ', 
			latitude: 40.41745, longitude: -3.703233, contact_name: 'Springfield', contact_number: 915211308)
venue_user2.venues.create(venue_name: 'Harrods', address: '87-135 Brompton Road Knightsbridge, London', description: "The most famous department store online with instant access to the latest men's and women's fashion, accessories, gifts and food.", 
			latitude: 51.499767, longitude: -0.163254, contact_name: 'Harrods', contact_number: +442077301234)

