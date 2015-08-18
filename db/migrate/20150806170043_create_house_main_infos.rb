class CreateHouseMainInfos < ActiveRecord::Migration
  def change
    create_table :house_main_infos do |t|
      t.integer :actable_as_house_id
      t.string :actable_as_house_type

      t.string :house_class
      t.string :availability
      t.date :end_date
      t.date :start_date
      t.float :price_from
      t.string :builder_site
      t.string :phone

      t.timestamps null: false
    end
  end
end
