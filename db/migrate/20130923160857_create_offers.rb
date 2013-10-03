class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.integer :price
      t.string :description
      t.string :city
      t.float :points, default: 0
      t.datetime :start_date
      t.datetime :finish_date
      t.integer :offer_type
      t.integer :number, default: 0
      t.integer :venue_id
      t.string :title

      t.timestamps
    end
  end
end
