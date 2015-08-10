# == Schema Information
#
# Table name: users
#
#  id          :integer          not null, primary key
#  first_name  :string
#  middle_name :string
#  last_name   :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Client < RegisteredUser
  crm_admin do
    index do

    end
  end
end
