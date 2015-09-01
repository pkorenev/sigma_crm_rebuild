# == Schema Information
#
# Table name: house_technical_infos
#
#  id                    :integer          not null, primary key
#  actable_as_house_id   :integer
#  actable_as_house_type :string
#  sections_count        :integer
#  building_type         :text
#  earth_area_square     :float
#  operated_roof         :text
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

class HouseTechnicalInfo < ActiveRecord::Base
  belongs_to :actable_as_house, polymorphic: true
end
