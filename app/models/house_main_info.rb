# == Schema Information
#
# Table name: house_main_infos
#
#  id                    :integer          not null, primary key
#  actable_as_house_id   :integer
#  actable_as_house_type :string
#  house_class                 :string
#  availability          :string
#  end_date              :date
#  start_date            :date
#  price_from            :float
#  builder_site          :string
#  phone                 :string
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

class HouseMainInfo < ActiveRecord::Base
  extend Enumerize

  belongs_to :actable_as_house, polymorphic: true

  attr_accessible *attribute_names

  enumerize :house_class, in: [:delux, :club, :elite, :business, :comfort, :standard, :econom]
  enumerize :availability, in: [:available_apartments_or_square, :no_available_apartments]
end
