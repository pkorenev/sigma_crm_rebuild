# == Schema Information
#
# Table name: apartments
#
#  id                         :integer          not null, primary key
#  building_complex_fast_link :integer
#  apartment_house_id         :integer
#  apartment_number           :integer
#  price                      :float
#  square                     :float
#  status                     :string
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#

class Apartment < ActiveRecord::Base
  extend Enumerize

  acts_as_apartment

  has_images styles: { thumbnail: "275x180#", large: "940x400#" }

  enumerize :status, in: [:building_in_process, :built, :project]

  #before_save :compile_fast_attributes
  def compile_fast_attributes
    self.building_complex_fast_link = self.building_complex_through_house.id
  end

  scope :published, proc { all }

end
