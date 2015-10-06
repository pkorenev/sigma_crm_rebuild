class CreateOurPartners < ActiveRecord::Migration
  def change
    create_table :our_partners do |t|
      t.string :name
      t.has_attached_file :image
      t.belongs_to :page_about_companies
      t.string :status
      t.string :url
      t.integer :position
      t.boolean :publication

      t.timestamps null: false
    end
  end
end
