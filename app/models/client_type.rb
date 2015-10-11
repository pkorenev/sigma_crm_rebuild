class ClientType < ActiveRecord::Base
  attr_accessible *attribute_names

  has_and_belongs_to_many :clients, class_name: "Sigma::Client", join_table: :client_type_bindings

  validates :name, :description, presence: true
end
