class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :companyable_type
      t.integer :companyable_id
      t.string :companyable_field_name

      t.string :name
      t.string :site

      t.timestamps null: false
    end
  end
end
