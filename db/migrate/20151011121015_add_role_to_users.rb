class AddRoleToUsers < ActiveRecord::Migration
  def change
    add_column :sigma_users, :role, :string
  end
end
