module Addressable
  module ActiveRecordExtensions
    extend ActiveSupport::Concern

    module ClassMethods

      def addressable(*options)
        has_one :address, as: :addressable, class_name: "Address"

      end

      def addressable?
        self._reflections.select{|key, r| r.options[:class_name] == "Address" }.any?
      end
    end
  end
end

ActiveRecord::Base.send(:include, Addressable::ActiveRecordExtensions)