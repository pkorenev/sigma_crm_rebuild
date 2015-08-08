class CreateAdministrativeUserInfos < ActiveRecord::Migration
  def change
    create_table :administrative_user_infos do |t|
      t.string :role
      t.integer :company_id
      t.string :contact_phone_number
      t.integer :group_id

      t.timestamps null: false
    end
  end
end
