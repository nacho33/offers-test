class User < ActiveRecord::Base
  	# Include default devise modules. Others available are:
  	# :token_authenticatable, :confirmable,
  	# :lockable, :timeoutable and :omniauthable
  	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  	# Setup accessible (or protected) attributes for your model
  	attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :role

	validates :email, :uniqueness => true
  validates_format_of :email, :with => /^([^\s]+)((?:[-a-z0-9]\.)[a-z]{2,})$/i
  
  attr_protected ROLES = %w[user admin venue]
  
  has_many :opinions, dependent: :destroy
  has_many :users_venues#, dependent: :destroy
  has_many :venues, :through => :users_venues

  before_destroy :before_destroy

  def before_destroy
    venues_delete = self.venues

    venues_delete.each do |v|
      v.destroy
    end
  end  
end
