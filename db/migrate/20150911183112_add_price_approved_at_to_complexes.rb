class AddPriceApprovedAtToComplexes < ActiveRecord::Migration
  def change
    add_column :sigma_building_complexes, :price_from_approved_at, :datetime
  end
end
