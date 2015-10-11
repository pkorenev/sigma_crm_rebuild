class AddFFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :sigma_users, :company_name, :string
    add_column :sigma_users, :company_site, :string
    add_column :sigma_users, :phone_number, :string
    add_column :sigma_users, :first_name, :string
    add_column :sigma_users, :middle_name, :string
    add_column :sigma_users, :last_name, :string
  end
end
