class Apartment < ActiveRecord::Base
  acts_as_apartment


  crm_admin do |m|
    m.visible false
  end
end
