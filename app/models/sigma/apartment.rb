# == Schema Information
#
# Table name: sigma_apartments
#
#  id                      :integer          not null, primary key
#  published               :boolean
#  building_complex_id     :integer
#  apartment_house_id      :integer
#  apartment_number        :string
#  price                   :float
#  building_premise_number :string
#  world_sides             :string
#  apartment_type          :string
#  live_square             :string
#  turnkey                 :text
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#

class Sigma::Apartment < ActiveRecord::Base
  self.table_name = :sigma_apartments
  attr_accessible *attribute_names
  extend CommonAttributeName
  extend Enumerize

  has_one :technical_settings, class_name: "Sigma::ApartmentTechnicalSettings", as: :building
  belongs_to :building_complex, class_name: "Sigma::BuildingComplex"
  belongs_to :apartment_house, class_name: "Sigma::ApartmentHouse"

  accepts_nested_attributes_for :technical_settings
  attr_accessible :technical_settings, :technical_settings_attributes

  attr_accessible :building_complex
  attr_accessible :apartment_house

  has_images :banner_images, styles: { thumbnail: "273x180#", large: "940x400#" }
  has_images :gallery_images, styles: { thumbnail: "273x180#", gallery_image: "1440x900#", gallery_thumb: "96x60#" }
  has_attachment :pdf_file

  has_many :apartment_actions, foreign_key: :apartment_id

  attr_accessible :apartment_actions

  enumerize :apartment_type, in: [:general, :studio, :mansard, :two_levels]

  #enumerize :status, in: [:building_in_process, :built, :project, :not_commissioned, :booked, :viewing, :sold], multiple: true

  enumerize :building_status, in: [:building_in_process, :built, :project]
  enumerize :sell_status, in: [:booked, :viewing, :sold]

  scope :published, -> { where(published: "t") }
  scope :available, -> { published.where("sell_status is null") }
  scope :unavailable, -> { where("published = ? or sell_status is not null", true) }
  #scope :group_by_houses


  # =========================================
  # -----------------------------------------
  # Validations
  # -----------------------------------------
  # =========================================
  validates :building_complex, presence: true
  validates :apartment_house, presence: true
  validates :apartment_number, presence: true
  validates :apartment_type, presence: true



  def street_address
    I18n.t("formats.street_address", street: apartment_house.street, street_number: apartment_house.street_number)
  end

  def apartment_type_and_rooms_count
    number = rooms_count
    word = ""
    if number.nil?
      word = "‒"
    elsif number % 10 == 0 || number % 10 > 4
      word = "кімнат"
    elsif number % 10 == 1 && number % 100 != 11
      word = "кімната"
    elsif number % 10 >= 2 && number % 10 <= 4
      word = "кімнати"
    end
    "#{I18n.t("enumerize.sigma/apartment.apartment_type.#{apartment_type}")}, #{rooms_count} #{word}"
  end

  def apartment_address
    "#{street_address}/#{apartment_number}"
  end

  def available?
    status.blank? || (!status.booked? && !status.viewing? && !status.sold?)
  end

  def apartment_status
    res = [building_status]
    res += ["commisioned"] if commissioned?
    res += ["not_commissioned"] unless commissioned?
    res += ( [sell_status])
    res.select(&:present?)
  end

  def list_apartment_status
    apartment_status.map do |status_tag|
      next "minus-square" if status_tag == "not_commissioned"
    end
  end

  def avatar
    banner_images.first.data
  end

  def object_label
    apartment_address
  end



end
