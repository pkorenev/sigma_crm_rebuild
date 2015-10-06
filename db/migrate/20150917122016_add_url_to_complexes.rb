class AddUrlToComplexes < ActiveRecord::Migration
  def change
  	add_column :sigma_building_complexes, :complex_url, :string
  end
end
