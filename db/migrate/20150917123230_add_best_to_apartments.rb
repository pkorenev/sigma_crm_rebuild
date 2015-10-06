class AddBestToApartments < ActiveRecord::Migration
  def change
  	add_column :sigma_apartments, :best, :boolean
  end
end
