class CreateHouseTechnicalInfos < ActiveRecord::Migration
  def change
    create_table :house_technical_infos do |t|
      t.integer :sections_count
      t.text :building_type
      t.float :earth_area_square

      t.timestamps null: false
    end
  end
end
