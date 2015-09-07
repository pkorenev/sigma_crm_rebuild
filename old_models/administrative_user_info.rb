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

class AdministrativeUserInfo < ActiveRecord::Base
end
