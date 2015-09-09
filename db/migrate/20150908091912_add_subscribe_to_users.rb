class AddSubscribeToUsers < ActiveRecord::Migration
  def change
    add_column :sigma_users, :subscribe, :boolean


  end
end
