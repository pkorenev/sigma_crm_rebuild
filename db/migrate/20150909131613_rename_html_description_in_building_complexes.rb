class RenameHtmlDescriptionInBuildingComplexes < ActiveRecord::Migration
  def change
    rename_column :sigma_building_complexes, :html_description, :main_description_html
    add_column :sigma_building_complexes, :infrastructure_description_html, :text
  end
end
