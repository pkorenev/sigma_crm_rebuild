# == Schema Information
#
# Table name: apartments
#
#  id                 :integer          not null, primary key
#  apartment_house_id :integer
#  apartment_number   :integer
#  price_from         :string
#  square             :float
#  status             :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Apartment < ActiveRecord::Base
  acts_as_apartment


  crm_admin do
    visible false

    list do
      field :name
    end
  end
end
