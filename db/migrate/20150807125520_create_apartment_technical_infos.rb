class CreateApartmentTechnicalInfos < ActiveRecord::Migration
  def change
    create_table :apartment_technical_infos do |t|
      t.integer :actable_as_apartment_id
      t.string :actable_as_apartment_type

      t.integer :level
      t.string :world_sides
      t.string :apartment_type
      t.float :live_square
      t.string :building_number
      t.string :outer
      t.text :exterior_walls
      t.text :apartment_separator_walls
      t.text :apartment_inner_separator_walls
      t.float :height
      t.string :filling_openings_in_walls
      t.text :telephony
      t.text :internet
      t.text :tv
      t.text :kitchen_stove_type
      t.text :wiring
      t.text :sanitary_equipment
      t.text :heating
      t.text :ventilation
      t.text :water_supply
      t.text :internal_sewer_system
      t.text :internal_finishing_work
      t.text :additional_info
      t.text :turnkey_apartment

      t.timestamps null: false
    end
  end
end
