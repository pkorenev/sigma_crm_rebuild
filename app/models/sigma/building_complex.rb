class Sigma::BuildingComplex < ActiveRecord::Base
  has_one :apartment_defaults, class_name: "Sigma::ApartmentTechnicalSettings", as: :building

  has_one :apartment_house_defaults, class_name: "Sigma::ApartmentTechnicalSettings", as: :building

  extend CommonAttributeName
end
