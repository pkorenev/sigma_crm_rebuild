# == Schema Information
#
# Table name: apartment_houses
#
#  id         :integer          not null, primary key
#  complex_id :integer
#  price_from :float
#  start_date :date
#  end_date   :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ApartmentHouse < ActiveRecord::Base
  acts_as_apartment_house
  has_images styles: { thumbnail: "275x180#", large: "940x400#" }


end
