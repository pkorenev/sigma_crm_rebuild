class CreateSigmaBuildingComplexes < ActiveRecord::Migration
  def change
    create_table :sigma_building_complexes do |t|


      # main info
      t.boolean :published
      t.text :short_description
      t.text :html_description
      t.string :name
      t.string :complex_class
      t.integer :apartment_houses_count
      t.string :site


      # address
      t.string :coordinates
      t.string :country
      t.string :city
      t.string :district
      t.string :street
      t.string :street_number

      t.string :status
      t.string :availability
      t.date :building_start_date
      t.date :building_end_date
      t.integer :houses_count
      t.integer :price_from
      t.datetime :price_from_approved_at
      t.string :phone

      # infrastructure
      t.text :distance_to_pre_school
      t.text :distance_to_school
      t.text :distance_to_food_markets
      t.text :playground
      t.text :nearest_metro_station
      t.text :nearest_bus_stop




      # technical info

      t.float :earth_area_square
      t.float :total_complex_square

      t.float :total_live_square
      t.integer :total_accommodations_count
      t.float :commerce_square_of_residential_premises

      # house defaults
      # table :sigma_house_technical_settings


      # apartment defaults
      # table :sigma_apartment_technical_settings



      # count fields
      t.integer :apartment_houses_count

      t.timestamps null: false
    end
  end
end
