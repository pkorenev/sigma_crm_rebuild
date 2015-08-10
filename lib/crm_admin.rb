require 'crm_admin/active_record_extensions'
require 'crm_admin/config'


module CrmAdmin
  def self.config(entity = nil, &block)
    CrmAdmin::Config.initialize

    unless block_given?
      if entity.nil?
        return CrmAdmin::Config
      else
        model_config = CrmAdmin::Config::AbstractModel
        return model_config
      end
    end

    if entity.nil?
      yield(CrmAdmin::Config)
    else
      CrmAdmin::Config.current_config_context = entity
      #entity.instance_eval()
      model_config_class = CrmAdmin::Config::AbstractModel

      if entity.is_a?(String)
        entity_name = entity.classify
        if Object.const_defined?(entity_name)
          entity = entity.constantize
        else
          return nil
        end
      end

      if entity.is_a?(Class)
        model_config_class.instance_eval &block
      else
        model_config_class.instance_exec entity, &block
      end


      #block.call

      CrmAdmin::Config.current_config_context = nil
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
#
#
#
#
#
#
#
#
#
#

# module Invitable
#   def invite
#     puts self.name
#   end
#
#   def invited?(user)
#
#   end
#
#   def invited
#
#   end
#
#   def invited_by(user)
#
#   end
#
#   def invited_by?(user)
#
#   end
#
#   def invited_at
#
#   end
#
#   def invitations
#
#   end
#
#   class << self
#     def all_invited
#
#     end
#   end
# end
#
# module Callable
#   def call_to(user)
#
#   end
#
#   def invite
#     puts "Callable"
#   end
# end
#
# module SuperInvitable
#   include Invitable
#   include Callable
#
#   extend Invitable
# end
#
# class Teacher
#   include Invitable
# end
#
# class Student
#   extend Invitable
# end
#
# class SuperStudent < Student
#   extend Callable
# end
#
# class Professor
#   extend SuperInvitable
#   extend Invitable
#
#   def self.measure_for
#     val = 0
#     puts(Benchmark.measure() do
#       for i in 1..5**10
#         val += 1
#       end
#     end)
#
#     val
#   end
#
#   def self.measure_each
#     val = 0
#     puts(Benchmark.measure() do
#            (1..5**10).each do
#              val += 1
#            end
#          end)
#     val
#   end
#
#   def self.measure_times
#     val = 0
#     puts(Benchmark.measure() do
#            (5**10).times do
#              val += 1
#            end
#          end)
#     val
#   end
#
#   def self.block_call(&block)
#     block.call
#   end
#
#   def self.yield
#
#     puts "before yield"
#
#     a, b = 1, 2
#
#     yield a, b
#     puts "after yield"
#   end
#
#   def self.block_call2(&block)
#     block.call(*Apartment.all)
#   end
#
# end


