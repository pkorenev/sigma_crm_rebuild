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

class User < ActiveRecord::Base
  #include AttrAccessible::ActiveRecordExtensions

  crm_admin do
    visible false
    favorite_color :red
  end

  def self.who_am_i
    User.get_caller_file_name do
      
    end
  end
end
