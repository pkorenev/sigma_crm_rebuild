class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.integer :assetable_id
      t.string :assetable_type
      t.string :assetable_field_name
      t.has_attached_file :data

      t.timestamps null: false
    end
  end
end
