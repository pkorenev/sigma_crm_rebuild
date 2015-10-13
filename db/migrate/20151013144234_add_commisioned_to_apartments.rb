class AddCommisionedToApartments < ActiveRecord::Migration
  def change
    add_column :sigma_apartments, :commissioned, :boolean
  end
end
