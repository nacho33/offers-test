class UsersVenue < ActiveRecord::Base
  attr_accessible :user_id, :venue_id

  belongs_to :user
  belongs_to :venue 

  validates_presence_of :user, :venue
  validates_uniqueness_of :user_id, through: :venue_id

end
