# == Schema Information
#
# Table name: infrastructures
#
#  id                       :integer          not null, primary key
#  building_id              :integer
#  building_type            :string
#  distance_to_pre_school   :text
#  distance_to_school       :text
#  distance_to_food_markets :text
#  playground               :text
#  nearest_metro_station    :text
#  nearest_bus_stop         :text
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#

class Infrastructure < ActiveRecord::Base
end
