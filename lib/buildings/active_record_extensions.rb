module Buildings
  module ActiveRecordExtensions
    extend ActiveSupport::Concern

    module ClassMethods

      def has_house_properties
        has_one :main_info, class_name: "HouseMainInfo"

        has_one :technical_info, class_name: "HouseTechnicalInfo"

        attr_accessible :main_info, :technical_info

        has_one :apartment_technical_info
      end

      def acts_as_building_complex
        has_house_properties
        has_builder


        has_many :apartment_houses

        has_infrastructure
      end

      def acts_as_house
        has_house_properties
        belongs_to :building_complex
        has_builder
      end

      def acts_as_apartment_house
        acts_as_house
        has_many :apartments
      end

      def acts_as_penthouse
        acts_as_house
      end

      def acts_as_apartment
        belongs_to :apartment_house
      end

      def has_infrastructure
        has_one :infrastructure
      end

      def has_builder
        has_company(:builder)
      end

      def has_company(field_name)
        has_one field_name, -> { where(companyable_field_name: field_name) }, class_name: "Company", as: :companyable, dependent: :destroy, autosave: true
        attr_accessible field_name
      end


    end
  end
end

ActiveRecord::Base.send(:include, Buildings::ActiveRecordExtensions)