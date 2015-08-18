# == Schema Information
#
# Table name: apartment_technical_infos
#
#  id                              :integer          not null, primary key
#  level                           :integer
#  world_sides                     :string
#  apartment_type                  :string
#  live_square                     :float
#  building_number                 :string
#  outer                           :string
#  exterior_walls                  :text
#  apartment_separator_walls       :text
#  apartment_inner_separator_walls :text
#  height                          :float
#  filling_openings_in_walls       :string
#  telephony                       :text
#  internet                        :text
#  tv                              :text
#  kitchen_stove_type              :text
#  wiring                          :text
#  sanitary_equipment              :text
#  heating                         :text
#  ventilation                     :text
#  water_supply                    :text
#  internal_sewer_system           :text
#  internal_finishing_work         :text
#  additional_info                 :text
#  turnkey_apartment               :text
#  created_at                      :datetime         not null
#  updated_at                      :datetime         not null
#

class ApartmentTechnicalInfo < ActiveRecord::Base
  belongs_to :actable_as_apartment, polymorphic: true
end
