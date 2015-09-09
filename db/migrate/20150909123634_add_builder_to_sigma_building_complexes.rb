class AddBuilderToSigmaBuildingComplexes < ActiveRecord::Migration
  def change
    add_reference :sigma_building_complexes, :builder, index: true, foreign_key: true
  end
end
