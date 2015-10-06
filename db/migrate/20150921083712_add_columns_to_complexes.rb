class AddColumnsToComplexes < ActiveRecord::Migration
  def change
  	add_column :sigma_building_complexes, :insulation_type_and_material, :text
  	#rename_column :sigma_building_complexes, :internal_finishing_work, :internal_finishing_work_in_accommodations
  	add_column :sigma_building_complexes, :internal_finishing_work_in_accommodations, :text
  	add_column :sigma_building_complexes, :internal_finishing_work_in_residential_premises, :text
  	add_column :sigma_building_complexes, :internal_finishing_work_in_common_use_premises, :text
  end
end
