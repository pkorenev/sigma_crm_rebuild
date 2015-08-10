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

class Company < ActiveRecord::Base
  belongs_to :companyable, polymorphic: true
end
