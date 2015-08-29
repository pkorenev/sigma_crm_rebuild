class Sigma::ApartmentHouse < ActiveRecord::Base
  has_one :apartment_defaults, class_name: "Sigma::ApartmentTechnicalSettings", as: :building

  has_one :technical_settings, class_name: "Sigma::ApartmentTechnicalSettings", as: :building

  extend CommonAttributeName
end
