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

  class << self
    attr_accessor :fields
    def field name, type
      @fields ||= []
      @fields << {}
    end

    def fields

    end
  end

end
