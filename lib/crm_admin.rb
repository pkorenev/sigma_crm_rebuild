require 'crm_admin/active_record_extensions'
require 'crm_admin/config'


module CrmAdmin
  class << self
    def config(entity = nil, &block)
      CrmAdmin::Config.initialize

      unless block_given?
        if entity.nil?
          return CrmAdmin::Config
        elsif entity.is_a?(Class)
          if entity.class_variable_defined?(:@@crm_config)
            entity.class_variable_get(:@@crm_config)
          end
        end
      end
    end


  end
end




## TODO
# 1. Use cases
#  class Apartment < ActiveRecord::Base
#  addressable do
#    require :apartment_number
#    inherit :country, :city, :street, :house_number, from: :house, required: true
#    format "%{street}, %{house_number}/%{apartment_number}"
#  end
#  acts_as_resource
#  has_attachment :avatar
#  has_attachments :schemes, length: 3..5
#   crm_admin do
#     visible do
#       true
#     end
#     list :data_table do
#       sortable do
#         field :name
#       end
#       filterable do
#         field :address
#       end
#     end
#     new :wizard do
#       use :apartment_wizard
#       step :main_info do
#         address
#       end
#
#       step :technical_details
#       step :attachments do
#
#       end
#       step :total do
#
#       end
#     end
#   end
#
#


