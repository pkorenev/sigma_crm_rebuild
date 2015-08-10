# == Schema Information
#
# Table name: companies
#
#  id                     :integer          not null, primary key
#  companyable_type       :string
#  companyable_id         :integer
#  companyable_field_name :string
#  name                   :string
#  site                   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

require 'test_helper'

class CompanyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
