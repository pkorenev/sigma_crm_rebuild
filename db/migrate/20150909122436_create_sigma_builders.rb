class CreateSigmaBuilders < ActiveRecord::Migration
  def change
    create_table :sigma_builders do |t|
      t.string :name
      t.string :site

      t.timestamps null: false
    end
  end
end
