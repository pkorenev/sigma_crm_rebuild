class CreateAuthorizations < ActiveRecord::Migration
  def change
    create_table :authorizations do |t|
      t.string :provider
      t.string :uid
      t.belongs_to :sigma_users
      t.string :token
      t.string :secret
      t.string :username

      t.timestamps null: false
    end
  end
end
