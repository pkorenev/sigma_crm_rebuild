class Sigma::Apartment < ActiveRecord::Base
  self.table_name = :sigma_apartments
  attr_accessible *attribute_names
  extend CommonAttributeName

  has_one :technical_settings, class_name: "Sigma::ApartmentTechnicalSettings", as: :building
  belongs_to :building_complex, class_name: "Sigma::BuildingComplex"
  belongs_to :apartment_house, class_name: "Sigma::ApartmentHouse"

  accepts_nested_attributes_for :technical_settings
  attr_accessible :technical_settings, :technical_settings_attributes

  attr_accessible :building_complex
  attr_accessible :apartment_house

  has_images

  def street_address
    I18n.t("formats.street_address", street: apartment_house.street, street_number: apartment_house.street_number)
  end
end
