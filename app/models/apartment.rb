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

  has_images styles: { thumbnail: "275x180#", large: "940x400#" }

  before_save :compile_fast_attributes
  def compile_fast_attributes
    self.building_complex_fast_link = self.building_complex_through_house.id
  end

end
