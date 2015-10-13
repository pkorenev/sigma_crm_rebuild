class AddBuildingStatusToApartments < ActiveRecord::Migration
  def change
    add_column :sigma_apartments, :building_status, :string
  end
end
