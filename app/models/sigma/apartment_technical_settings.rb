class Sigma::ApartmentTechnicalSettings < ActiveRecord::Base
  self.table_name = :sigma_apartment_technical_settings

  belongs_to :building, polymorphic: true

  extend CommonAttributeName
end
