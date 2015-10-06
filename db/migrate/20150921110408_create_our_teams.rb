class CreateOurTeams < ActiveRecord::Migration
  def change
    create_table :our_teams do |t|
      t.string :name
      t.has_attached_file :image
      t.belongs_to :page_about_companies
      t.string :status
      t.boolean :published
      t.integer :position

      t.timestamps null: false
    end
  end
end
