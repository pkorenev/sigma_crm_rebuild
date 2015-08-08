class BuildingComplex < ActiveRecord::Base
  extend Enumerize

  acts_as_building_complex

  enumerize :status, in: [:building_in_process, :built, :project]
end
