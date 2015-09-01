# == Schema Information
#
# Table name: sigma_agreements
#
#  id          :integer          not null, primary key
#  code_number :string
#  laid_at     :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class Sigma::AgreementTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
