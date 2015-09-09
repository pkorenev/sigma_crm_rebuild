class AddColumnsToSigmaApartments < ActiveRecord::Migration
  def change
    add_column :sigma_apartments, :infrastructure_description_html, :text
    add_column :sigma_apartments, :main_description_html, :text
  end
end
