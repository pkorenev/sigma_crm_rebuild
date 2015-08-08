class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :addressable_type
      t.integer :addressable_id


      t.string :street
      t.string :city
      t.string :country
      t.string :district
      t.string :region
      t.string :house_number
      t.string :apartment_number
      t.string :google_place_id

      t.timestamps null: false
    end
  end
end
