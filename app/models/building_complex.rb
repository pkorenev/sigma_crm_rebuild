# == Schema Information
#
# Table name: building_complexes
#
#  id         :integer          not null, primary key
#  name       :string
#  status     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class BuildingComplex < ActiveRecord::Base
  extend Enumerize



  acts_as_building_complex



  enumerize :status, in: [:building_in_process, :built, :project]
end
