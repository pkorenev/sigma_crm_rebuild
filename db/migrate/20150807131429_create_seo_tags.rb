class CreateSeoTags < ActiveRecord::Migration
  def change
    create_table :seo_tags do |t|
      t.integer :resource_id
      t.string :resource_type
      t.string :title
      t.text :keywords
      t.text :description

      t.timestamps null: false
    end
  end
end
