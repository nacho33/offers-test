class CreateUsersVenues < ActiveRecord::Migration

  def self.up
    create_table :users_venues, :id => true do |t|
        t.references :venue
        t.references :user
    end
    add_index :users_venues, [:venue_id, :user_id], :unique => :true, :name => 'by_venue_id_and_user_id'
    add_index :users_venues, [:user_id, :venue_id], :unique => :true, :name => 'by_user_id_and_venue_id'
  end

  def self.down
    drop_table :users_venues
  end

end
