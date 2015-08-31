class Sigma::ApartmentTechnicalSettings < ActiveRecord::Base
  attr_accessible *attribute_names
  extend CommonAttributeName

  self.table_name = :sigma_apartment_technical_settings

  belongs_to :building, polymorphic: true

  attr_accessible :building
end
