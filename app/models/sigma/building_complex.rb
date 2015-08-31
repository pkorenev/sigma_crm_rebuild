class Sigma::BuildingComplex < ActiveRecord::Base
  self.table_name = :sigma_building_complexes
  attr_accessible *attribute_names
  extend CommonAttributeName
  extend Enumerize

  has_one :apartment_defaults, class_name: "Sigma::ApartmentTechnicalSettings", as: :building
  has_one :apartment_house_defaults, class_name: "Sigma::HouseTechnicalSettings", as: :building
  has_many :apartment_houses, class_name: "Sigma::ApartmentHouse"
  has_many :apartments, class_name: "Sigma::Apartment"

  accepts_nested_attributes_for :apartment_defaults
  accepts_nested_attributes_for :apartment_house_defaults

  attr_accessible :apartment_house_defaults, :apartment_house_defaults_attributes
  attr_accessible :apartment_defaults_attributes, :apartment_defaults
  attr_accessible :apartment_houses
  attr_accessible :apartments

  enumerize :status, in: [:building_in_process, :built, :project]

  def apartment_houses_count
    apartment_houses.length
  end

  def complex_class
    apartment_house_defaults.try(&:house_class)
  end
end
