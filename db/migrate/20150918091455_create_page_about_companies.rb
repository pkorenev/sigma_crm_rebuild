class CreatePageAboutCompanies < ActiveRecord::Migration
  def change
    create_table :page_about_companies do |t|

      t.timestamps null: false
    end
  end
end
