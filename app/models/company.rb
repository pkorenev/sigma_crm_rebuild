class Company < ActiveRecord::Base
  belongs_to :companyable, polymorphic: true
end
