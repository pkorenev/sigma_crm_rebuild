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

require 'test_helper'

class Sigma::ApartmentHouseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
