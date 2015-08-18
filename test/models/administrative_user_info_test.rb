# == Schema Information
#
# Table name: administrative_user_infos
#
#  id                   :integer          not null, primary key
#  role                 :string
#  company_id           :integer
#  contact_phone_number :string
#  group_id             :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

require 'test_helper'

class AdministrativeUserInfoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
