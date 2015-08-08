class CreateInfrastructures < ActiveRecord::Migration
  def change
    create_table :infrastructures do |t|
      t.integer :building_id
      t.string :building_type
      t.text :distance_to_pre_school
      t.text :distance_to_school
      t.text :distance_to_food_markets
      t.text :playground
      t.text :nearest_metro_station
      t.text :nearest_bus_stop

      t.timestamps null: false
    end
  end
end
