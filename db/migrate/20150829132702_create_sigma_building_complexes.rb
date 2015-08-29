class CreateSigmaBuildingComplexes < ActiveRecord::Migration
  def change
    create_table :sigma_building_complexes do |t|


      # main info
      t.string :name


      # address
      t.string :address_coordinates
      t.string :address_city
      t.string :address_district
      t.string :address_street
      t.string :address_house_number

      t.string :status
      t.string :availability
      t.date :building_start_date
      t.date :building_end_date
      t.integer :houses_count
      t.float :price_from
      t.string :builder_site
      t.string :phone

      # infrastructure
      t.text :infrastructure_distance_to_pre_school
      t.text :infrastructure_distance_to_school
      t.text :infrastructure_distance_to_food_markets
      t.text :infrastructure_playground
      t.text :infrastructure_nearest_metro_station
      t.text :infrastructure_nearest_bus_stop




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



      t.timestamps null: false
    end
  end
end
