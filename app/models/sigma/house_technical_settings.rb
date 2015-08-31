class Sigma::HouseTechnicalSettings < ActiveRecord::Base
  attr_accessible *attribute_names
  extend CommonAttributeName

  self.table_name = :sigma_house_technical_settings

  belongs_to :building, polymorphic: true



  attr_accessible :building

  extend Enumerize

  enumerize :house_class, in: [:delux, :club, :elite, :business, :comfort, :standard, :econom]

  validates :house_class, presence: true
end
