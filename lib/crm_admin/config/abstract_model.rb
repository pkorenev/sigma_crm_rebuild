module CrmAdmin
  module Config
    module AbstractModel
      class << self
        attr_accessor :visible

        def context_resource
          CrmAdmin::Config.current_config_context
        end

        def visible(value = true)
          hidden = value != true
          @visible = !hidden

          if hidden
            CrmAdmin::Config.hidden_models += [context_resource]
          else
            CrmAdmin::Config.visible_models += [context_resource]
          end
        end
      end
    end
  end
end