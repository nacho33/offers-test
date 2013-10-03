class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :venue_name
      t.string :address
      t.string :description
      t.float :latitude
      t.float :longitude
      t.string :contact_name
      t.string :contact_number

      t.timestamps
    end
  end
end
