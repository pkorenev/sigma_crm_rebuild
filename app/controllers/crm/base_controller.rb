module Crm
  class BaseController < ::ResourcesController
    self.layout "crm"
    include Rails.application.routes.url_helpers

    before_action :reset_fields
    before_action :init_fields, only: [:index, :show, :edit, :new, :update, :create]
    before_action :init_list_fields, only: :index
    before_action :init_show_fields, only: :show
    before_action :init_edit_fields, only: [:edit, :update, :new, :create]
    before_action :init_new_fields, only: [:new, :create]

    def index
      @resources ||= resource_class.all.page(params[:page])
    end

    def reset_fields
      @fields = []
    end

    def field name, &block
      f = {}
      f[:name] = name

      @_field_context ||= []



      ctx_field = nil

      @_field_context.each do |field_key|
        if ctx_field.nil?
          ctx_field = ( @fields ).select{|f| f[:name].to_sym == name.to_sym }.first
        else
          ctx_field = ctx_field[:fields].select{|f| f[:name].to_sym == name.to_sym }.first
        end
      end

      if ctx_field
        if ctx_field[:fields].nil?
          ctx_field[:fields] = []
        end

        ctx_field[:fields] << f


        if block_given?
          @_field_context << name.to_sym
          yield
          @_field_context.delete_at(@_field_context.length - 1)
        end
      else
        @fields << f
      end
    end

    def render_field name, &block

    end

    def compute_field_config name, resource = @resource
      @fields.select{|f| f[:name] == name }.first.try do |f|
        if f[:type].blank?
          if ref = resource._reflections[f[:name].to_s]
            if ref.class_name == "Address"
              break f
            end

            f[:association] = true
            f[:type] = ref.class.name.split("::").last.gsub(/Reflection\Z/, "").underscore.to_sym
            f[:nested] = resource.nested_attributes_options.keys.include?(name.to_sym)
          end
        end

        f
      end
    end

    helper_method :compute_field_config

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