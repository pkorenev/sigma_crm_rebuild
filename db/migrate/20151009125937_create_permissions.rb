class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.datetime :set_at
      t.integer :set_by_user_id
      t.string :set_by_user_type
      t.string :permissionable_type
      t.integer :permissionable_id
      t.boolean :can
      t.string :action
      t.string :subject_class
      t.integer :subject_id

      t.timestamps null: false
    end
  end
end
