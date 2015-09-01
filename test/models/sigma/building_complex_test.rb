# == Schema Information
#
# Table name: sigma_building_complexes
#
#  id                                      :integer          not null, primary key
#  name                                    :string
#  complex_class                           :string
#  coordinates                             :string
#  country                                 :string
#  city                                    :string
#  district                                :string
#  street                                  :string
#  street_number                           :string
#  status                                  :string
#  availability                            :string
#  building_start_date                     :date
#  building_end_date                       :date
#  houses_count                            :integer
#  price_from                              :float
#  builder_site                            :string
#  phone                                   :string
#  distance_to_pre_school                  :text
#  distance_to_school                      :text
#  distance_to_food_markets                :text
#  playground                              :text
#  nearest_metro_station                   :text
#  nearest_bus_stop                        :text
#  earth_area_square                       :float
#  total_complex_square                    :float
#  total_live_square                       :float
#  total_accommodations_count              :integer
#  commerce_square_of_residential_premises :float
#  created_at                              :datetime         not null
#  updated_at                              :datetime         not null
#

require 'test_helper'

class Sigma::BuildingComplexTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
