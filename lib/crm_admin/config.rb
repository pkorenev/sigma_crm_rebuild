require 'has_fields'
require 'crm_admin/config/base_model'

module CrmAdmin
  module Config
    class << self
      attr_accessor :initialized
      attr_accessor :included_models
      attr_accessor :visible_models

      def hide_model model
        model = Object.const_defined?(model)
        @visible_models.delete model if model
      end

      def hide_models *models
        models.each do |m|
          hide_model m
        end
      end

      def show_model(model)
        @visible_models << model unless @visible_models.index(model) == 0
      end

      def initialize
        @included_models ||= []
        @visible_models ||= []
      end

      def initialized?
        !!@initialized
      end
    end
  end
end