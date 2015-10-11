class CreateClientTypeBindings < ActiveRecord::Migration
  def change
    create_table :client_type_bindings do |t|
      t.belongs_to :client
      t.belongs_to :client_type
    end
  end
end
