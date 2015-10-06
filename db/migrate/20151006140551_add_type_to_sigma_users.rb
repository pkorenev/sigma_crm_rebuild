class AddTypeToSigmaUsers < ActiveRecord::Migration
  def change
    add_column :sigma_users, :type, :string
  end
end
