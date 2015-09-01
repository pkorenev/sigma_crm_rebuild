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

class Sigma::Agreement < ActiveRecord::Base
  self.table_name = :sigma_agreements

  belongs_to :apartment, class_name: "Sigma::Apartment"
  belongs_to :client, class_name: "Sigma::Client"
  belongs_to :manager, class_name: "Sigma::Administrator"
  belongs_to :agreement_template

  scope :laid, -> { where("laid_at is not null") }
  scope :unlaid, -> { where("laid_at is null") }
end
