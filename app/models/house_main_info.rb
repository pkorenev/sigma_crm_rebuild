class HouseMainInfo < ActiveRecord::Base
  extend Enumerize

  attr_accessible *attribute_names

  enumerize :class, in: [:delux, :club, :elite, :business, :comfort, :standard, :econom]
  enumerize :availability, in: [:available_apartments_or_square, :no_available_apartments]
end
