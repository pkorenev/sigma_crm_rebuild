class CreateApartmentHouses < ActiveRecord::Migration
  def change
    create_table :apartment_houses do |t|
      t.integer :complex_id
      t.float :price_from
      t.date :start_date
      t.date :end_date

      t.timestamps null: false
    end
  end
end
