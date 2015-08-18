module Crm
  class ResourcesController < ::ResourcesController
    before_action :configure_fields, :configure_actions
    def resource_class_name
      super["CrmAdmin::".length, super.length]
    end

    def configure_fields
      @fields ||= []
    end

    def configure_actions
      @actions = [:index, :new, :edit, :delete]
    end
  end
end