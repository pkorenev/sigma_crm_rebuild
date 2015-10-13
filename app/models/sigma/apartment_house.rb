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

  def apartment_1_rooms_count
    apartment_n_rooms_count(1)
  end

  def apartment_2_rooms_count
    apartment_n_rooms_count(2)
  end

  def apartment_3_rooms_count
    apartment_n_rooms_count(3)
  end

  def apartment_4_rooms_count
    apartment_n_rooms_count(4)
  end

  def apartment_5_plus_rooms_count
    apartments.where("rooms_count > 4").count
  end

  def apartment_n_rooms_count(rooms_count)
    #joins(:sigma_apartments)
    apartments.where(rooms_count: rooms_count).count
  end

  def street_address
    "#{street}, #{street_number}"
  end


end
