# == Schema Information
#
# Table name: agreement_templates
#
#  id          :integer          not null, primary key
#  name        :string
#  html_source :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class AgreementTemplateTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
