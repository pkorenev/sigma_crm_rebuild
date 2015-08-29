class Sigma::HouseTechnicalSettings < ActiveRecord::Base
  self.table_name = :sigma_house_technical_settings

  belongs_to :building, polymorphic: true

  extend CommonAttributeName
end
