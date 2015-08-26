module Crm
  class ResourcesController < ::ResourcesController
    #before_action :authenticate_account!, unless: :json_request?
    before_action :configure_fields, :configure_actions

    def index
      @resources ||= resource_class.all.page(params[:page])
    end

    def resources_path_name
      "crm_#{super}"
    end

    def resource_path_name
      "crm_#{super}"
    end

    def resource_class_name
      super["Crm::".length, super.length]
    end

    def configure_fields
      @fields ||= []
    end

    def configure_actions
      @actions = [:index, :new, :edit, :delete]
    end
  end
end