class ApartmentAction < ActiveRecord::Base
  attr_accessible *attribute_names
  belongs_to :apartment, class_name: "Sigma::Apartment"
  belongs_to :manager, class_name: "Sigma::Manager", foreign_key: :manager_id
  belongs_to :client, class_name: "Sigma::Client", foreign_key: :client_id

  attr_accessible :apartment, :manager, :client
end
