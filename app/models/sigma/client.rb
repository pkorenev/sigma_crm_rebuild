# == Schema Information
#
# Table name: sigma_users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default("")
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  invitation_token       :string
#  invitation_created_at  :datetime
#  invitation_sent_at     :datetime
#  invitation_accepted_at :datetime
#  invitation_limit       :integer
#  invited_by_id          :integer
#  invited_by_type        :string
#  invitations_count      :integer          default(0)
#

class Sigma::Client < User
  belongs_to :manager, class_name: "Sigma::Manager"
  #has_and_belongs_to_many :managers, class_name: "Sigma::Manager", join_table: "clients_managers_bindings"


  has_and_belongs_to_many :client_types, class_name: "ClientType", join_table: :client_type_bindings
  attr_accessible :client_types, :client_type_ids

  #has_one :client_info

  #attr_accessible :client_info

  before_save :set_crm_allowed_at

  has_many :apartment_actions, foreign_key: :client_id
  attr_accessible :apartment_actions

  def set_crm_allowed_at
    self.crm_allowed_at ||= DateTime.now if self.manager_id.present?
  end

end
