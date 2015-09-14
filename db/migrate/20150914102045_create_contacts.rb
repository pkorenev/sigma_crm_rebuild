class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :country
      t.string :city
      t.string :address
      t.string :m_phone
      t.string :s_phone
      t.string :t_phone
      t.string :m_email
      t.string :s_email
      t.string :map
      t.string :facebook
      t.string :google
      t.string :twitter
      t.string :instagram
      t.string :youtube
      t.text :timetable

      t.timestamps null: false
    end
  end
end
