class CreateBuildingComplexes < ActiveRecord::Migration
  def change
    create_table :building_complexes do |t|
      t.string :name
      t.string :status
      t.string :total_square

      t.timestamps null: false
    end
  end
end