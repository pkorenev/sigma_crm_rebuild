class CreateComplexBanners < ActiveRecord::Migration
 def change
   create_table :complex_banners do |t|
     t.has_attached_file :image
     t.belongs_to :banner
     t.string :title
     t.string :url
     t.text :description
     t.string :complex_class
     t.boolean :published
     t.integer :position

     t.timestamps null: false
   end
 end
end