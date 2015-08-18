module Crm
  module ActiveRecordExtensions
    extend ActiveSupport::Concern

    module ClassMethods
      def admin(&block)

      end



    end
  end
end

ActiveRecord::Base.send(:include, Crm::ActiveRecordExtensions)