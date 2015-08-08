module CrmAdmin
  module ActiveRecordExtensions
    extend ActiveSupport::Concern

    module ClassMethods
      def crm_admin(&block)
        if CrmAdmin.respond_to?(:config)
          CrmAdmin.config(self, &block)
        end
      end

      alias config crm_admin
    end



  end
end

ActiveRecord::Base.send(:include, CrmAdmin::ActiveRecordExtensions)