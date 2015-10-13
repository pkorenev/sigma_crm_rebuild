class CreateApartmentActions < ActiveRecord::Migration
  def change
    create_table :apartment_actions do |t|
      t.string :type
      t.belongs_to :apartment, index: true, foreign_key: true
      t.belongs_to :client
      t.belongs_to :manager

      t.timestamps null: false
    end
  end
end
