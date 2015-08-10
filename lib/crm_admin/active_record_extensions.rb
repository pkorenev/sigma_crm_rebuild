module CrmAdmin
  module ActiveRecordExtensions
    extend ActiveSupport::Concern

    module ClassMethods
      def crm_admin(&block)
        if CrmAdmin.respond_to?(:config)
          CrmAdmin.config(self, &block)
        end
      end

      alias_method :config, :crm_admin
    end

    module SharedMethods
      def shared_crm_admin

      end
    end

    def instance_crm_admin

    end

    
  end
end

ActiveRecord::Base.send(:include, CrmAdmin::ActiveRecordExtensions)
#ActiveRecord::Base.send(:include, CrmAdmin::ActiveRecordExtensions::InstanceMethods)


# class Transport
#   crm_admin do
#
#     def color
#
#     end
#
#     color do
#       [:red, :grid, :blue].sample
#     end
#     visible :false
#
#     field :photo
#   end
# end
#
# class EarthTransport < Transport
#
# end
#
# class WaterTransport < Transport
#
# end
#
# class Car <
#
# end
#
# class