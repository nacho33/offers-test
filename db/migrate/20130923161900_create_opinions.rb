class CreateOpinions < ActiveRecord::Migration
  def change
    create_table :opinions do |t|
      t.integer :user_id
      t.string :description
      t.integer :points
      t.string :title
      t.string :offer_id

      t.timestamps
    end
  end
end
