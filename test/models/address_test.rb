# == Schema Information
#
# Table name: addresses
#
#  id               :integer          not null, primary key
#  addressable_type :string
#  addressable_id   :integer
#  street           :string
#  city             :string
#  country          :string
#  district         :string
#  region           :string
#  house_number     :string
#  apartment_number :string
#  google_place_id  :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'test_helper'

class AddressTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
