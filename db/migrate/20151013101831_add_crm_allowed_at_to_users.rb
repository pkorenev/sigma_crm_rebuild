class AddCrmAllowedAtToUsers < ActiveRecord::Migration
  def change
    add_column :users, :crm_allowed_at, :datetime
  end
end
