module Crm
  class BaseController < ::ResourcesController
    self.layout "crm"
    include Rails.application.routes.url_helpers

    before_action :reset_fields
    before_action :init_fields, only: [:index, :show, :edit, :new, :update, :create]
    before_action :init_list_fields, only: :index
    before_action :init_show_fields, only: :show
    before_action :init_edit_fields, only: [:edit, :update]
    before_action :init_new_fields, only: [:new, :create]

    def index
      @resources ||= resource_class.all.page(params[:page])
    end

    def reset_fields
      @fields = []
    end

    def field name
      f = {}
      f[:name] = name
      @fields << f
    end

    def init_fields

    end

    def init_list_fields

    end

    def init_show_fields

    end

    def init_edit_fields

    end

    def init_new_fields

    end

    def resource_params
      params.require(resource_name).permit(*@fields.keys)
    end

    def resource_class_name
      s = super
      s["Crm::".length, s.length]
    end

    def resource_path_name
      "crm_#{super}"
    end

    def resources_path_name
      "crm_#{super}"
    end
  end
end