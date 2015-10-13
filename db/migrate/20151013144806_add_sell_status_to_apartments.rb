class AddSellStatusToApartments < ActiveRecord::Migration
  def change
    add_column :sigma_apartments, :sell_status, :string
  end
end
