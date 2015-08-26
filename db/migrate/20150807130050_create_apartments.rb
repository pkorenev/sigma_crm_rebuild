class CreateApartments < ActiveRecord::Migration
  def change
    create_table :apartments do |t|
      t.integer :building_complex_fast_link
      t.integer :apartment_house_id
      t.integer :apartment_number
      t.string :price_from
      t.float :square
      t.string :status

      t.timestamps null: false
    end
  end
end
