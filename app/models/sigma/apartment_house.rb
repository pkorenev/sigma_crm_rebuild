# == Schema Information
#
# Table name: sigma_apartment_houses
#
#  id                  :integer          not null, primary key
#  published           :boolean
#  building_complex_id :integer
#  coordinates         :string
#  street              :string
#  street_number       :string
#  status              :string
#  building_start_date :date
#  building_end_date   :date
#  price_from          :float
#  levels_count        :integer
#  apartments_count    :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class Sigma::ApartmentHouse < ActiveRecord::Base
  self.table_name = :sigma_apartment_houses
  attr_accessible *attribute_names
  extend CommonAttributeName
  extend Enumerize

  has_one :apartment_defaults, class_name: "Sigma::ApartmentTechnicalSettings", as: :building
  has_one :technical_settings, class_name: "Sigma::HouseTechnicalSettings", as: :building
  belongs_to :building_complex, class_name: "Sigma::BuildingComplex"
  has_many :apartments, class_name: "Sigma::Apartment"

  accepts_nested_attributes_for :apartment_defaults
  attr_accessible :apartment_defaults, :apartment_defaults_attributes

  accepts_nested_attributes_for :technical_settings
  attr_accessible :technical_settings, :technical_settings_attributes

  attr_accessible :building_complex
  attr_accessible :apartments

  enumerize :status, in: [:building_in_process, :built, :project]

  # =========================================
  # -----------------------------------------
  # Validations
  # -----------------------------------------
  # =========================================
  validates :building_complex, presence: :true
  validates :status, presence: true

  def name

  end
end
