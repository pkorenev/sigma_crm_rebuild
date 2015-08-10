module CrmAdmin
  module Config
    module AbstractModel
      class << self
        include HasFields

        attr_accessor :configured_fields
        attr_accessor :visible
        attr_accessor :favorite_color
        attr_accessor :base_config


        def get_class
          class << self
            self
          end
        end

        def resource_class
          c = context_resource
          if c.is_a?(Class)
            return c
          else
            return c.class
          end
        end



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

        def favorite_color(color = nil)
          if color
            @favorite_color = color
          else
            return @favorite_color
          end
        end

        def group name, &block

        end
      end
    end
  end
end