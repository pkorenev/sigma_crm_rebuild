class CreateSigmaClientInfos < ActiveRecord::Migration
  def change
    # create_table :sigma_client_infos do |t|
    #   t.belongs_to :client, index: true, foreign_key: true
    #   t.text :how_you_had_known
    #   t.date :birthday
    #   t.string :identification_number
    #   t.string :passport_serial_number
    #   t.date :passport_date
    #   t.string :passport_given_by
    #
    #   t.timestamps null: false
    # end

    change_table :sigma_users do |t|
      t.belongs_to :client, index: true, foreign_key: true
      t.text :how_you_had_known
      t.date :birthday
      t.string :identification_number
      t.string :passport_serial_number
      t.date :passport_date
      t.string :passport_given_by
    end
  end
end
