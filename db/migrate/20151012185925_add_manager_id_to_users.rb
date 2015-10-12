class AddManagerIdToUsers < ActiveRecord::Migration
  def change
    add_column :sigma_users, :manager_id, :integer
  end
end
