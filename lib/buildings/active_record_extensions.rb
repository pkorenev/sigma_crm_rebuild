module Buildings
  module ActiveRecordExtensions
    extend ActiveSupport::Concern

    module ClassMethods

      def has_house_properties
        has_one :main_info, class_name: "HouseMainInfo", as: :actable_as_house, autosave: true

        has_one :technical_info, class_name: "HouseTechnicalInfo", as: :actable_as_house, autosave: true

        attr_accessible :main_info, :technical_info

        has_one :apartment_technical_info, class_name: "ApartmentTechnicalInfo", as: :actable_as_apartment, autosave: true
        
        # accepts_nested_attributes_for
        accepts_nested_attributes_for :main_info, :technical_info, :apartment_technical_info
        attr_accessible :main_info_attributes, :technical_info_attributes, :apartment_technical_info_attributes
      end

      def acts_as_building_complex
        addressable
        has_house_properties
        has_builder

        #self.extend AdvancedDelegateMethods


        has_many :apartment_houses, foreign_key: :complex_id

        has_infrastructure
      end

      def acts_as_house
        has_house_properties
        belongs_to :building_complex, foreign_key: :complex_id, class_name: "BuildingComplex"
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
        addressable
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

  module AdvancedDelegateMethods
    def advanced_delegate *args, **options
      target_name = options[:to]
      if self.send(target_name).blank?
        self.send("#{target_name}=", self._reflections[target_name.to_s].build_assiciation)
      end

      #if self.
    end
  end
end

ActiveRecord::Base.send(:include, Buildings::ActiveRecordExtensions)