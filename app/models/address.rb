# == Schema Information
#
# Table name: addresses
#
#  id               :integer          not null, primary key
#  addressable_type :string
#  addressable_id   :integer
#  street           :string
#  city             :string
#  country          :string
#  district         :string
#  region           :string
#  house_number     :string
#  apartment_number :string
#  google_place_id  :string
#  latitude         :float
#  longitude        :float
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Address < ActiveRecord::Base
  belongs_to :addressable, polymorphic: true
end
