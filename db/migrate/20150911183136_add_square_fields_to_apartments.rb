class AddSquareFieldsToApartments < ActiveRecord::Migration
  def change
    add_column :sigma_apartments, :total_square, :float
    add_column :sigma_apartments, :kitchen_square, :float
  end
end
