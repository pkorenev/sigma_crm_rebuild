class CreateSigmaApartments < ActiveRecord::Migration
  def change
    create_table :sigma_apartments do |t|
      t.boolean :published
      t.text :html_description
      t.belongs_to :building_complex
      t.belongs_to :apartment_house
      t.string :apartment_number
      t.integer :price
      t.datetime :price_approved_at

      t.integer :level

      t.integer :rooms_count
      t.string :building_premise_number
      t.string :world_sides
      t.string :apartment_type
      t.integer :live_square
      t.text :turnkey

      # technical_info



      t.timestamps null: false
    end
  end
end
