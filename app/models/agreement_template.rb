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

class AgreementTemplate < ActiveRecord::Base
end
