class AddStatusToApartments < ActiveRecord::Migration
  def change
    add_column :sigma_apartments, :status, :string
  end
end
