class AddAccomodationSquareToBuildingComplexes < ActiveRecord::Migration
  def change
  	add_column :sigma_building_complexes, :accomodation_commercial_square, :float
  end
end
