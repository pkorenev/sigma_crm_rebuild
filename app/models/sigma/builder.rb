class Sigma::Builder < ActiveRecord::Base
  has_many :complexes, :class_name => 'Sigma::BuildingComplex'
end
