class CreateApartmentBanners < ActiveRecord::Migration
 def change
   create_table :apartment_banners do |t|
     t.has_attached_file :image
     t.belongs_to :banner
     t.boolean :published
     t.integer :position

     t.timestamps null: false
   end
 end
end