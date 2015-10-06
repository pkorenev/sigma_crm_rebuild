class CreateIdentities < ActiveRecord::Migration
  def change
    create_table :identities do |t|
      t.references :sigma_user, index: true, foreign_key: true
      t.string :provider
      t.string :uid

      t.timestamps null: false
    end
  end
end
