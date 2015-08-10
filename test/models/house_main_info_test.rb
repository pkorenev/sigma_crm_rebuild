# == Schema Information
#
# Table name: house_main_infos
#
#  id                    :integer          not null, primary key
#  actable_as_house_id   :integer
#  actable_as_house_type :string
#  class                 :string
#  availability          :string
#  end_date              :date
#  start_date            :date
#  price_from            :float
#  builder_site          :string
#  phone                 :string
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

require 'test_helper'

class HouseMainInfoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
