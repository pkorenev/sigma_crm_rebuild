class CreateClientInfos < ActiveRecord::Migration
  def change
    create_table :client_infos do |t|
      t.date :birthday
      t.string :identification_number
      t.string :passport_series
      t.string :given_by

      t.timestamps null: false
    end
  end
end
