# == Schema Information
#
# Table name: client_infos
#
#  id                    :integer          not null, primary key
#  birthday              :date
#  identification_number :string
#  passport_series       :string
#  given_by              :string
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

require 'test_helper'

class ClientInfoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
