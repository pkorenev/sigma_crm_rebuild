class CreateClientsManagersBindings < ActiveRecord::Migration
  def change
    create_table :clients_managers_bindings do |t|
      t.belongs_to :client
      t.belongs_to :manager
    end
  end
end
