class Sigma::Apartment < ActiveRecord::Base
  has_one :technical_settings, class_name: "Sigma::ApartmentTechnicalSettings", as: :building

  extend CommonAttributeName
end
