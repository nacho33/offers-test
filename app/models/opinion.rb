class Opinion < ActiveRecord::Base
	attr_accessible :user_id, :description, :points, :title, :offer_id

	validates_presence_of :description, :title, :user, :offer

	belongs_to :user
	belongs_to :offer

  	scope :all_offer_opinions, lambda {|x| where('offer_id = ?', x).joins('LEFT OUTER JOIN users ON users.id = opinions.user_id').select('title, description, points, username')}
  

end
