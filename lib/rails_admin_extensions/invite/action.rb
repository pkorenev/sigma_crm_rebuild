


module RailsAdmin
  module Config
    module Actions
      class Invite < RailsAdmin::Config::Actions::Base
        RailsAdmin::Config::Actions.register(self)

        register_instance_option :collection do
          true
        end

        register_instance_option :http_methods do
          [:get, :post] # NEW / CREATE
        end

        register_instance_option :controller do
          proc do

            if request.get? # NEW


              @object = @abstract_model.new
              @authorization_adapter && @authorization_adapter.attributes_for(:invite, @abstract_model).each do |name, value|
                @object.send("#{name}=", value)
              end
              if object_params = params[@abstract_model.to_param]
                @object.set_attributes(@object.attributes.merge(object_params))
              end
              respond_to do |format|
                format.html { render @action.template_name }
                format.js   { render @action.template_name, layout: false }
              end

            elsif request.post? # CREATE
              #render inline: params.inspect
              #render inline: params.inspect
              
              @modified_assoc = []
              @object = @abstract_model.new
              #sanitize_params_for!(:invite)
              model = @abstract_model.model
              user_params = params[@abstract_model.param_key]
              @email = user_params[:email]
              role =  user_params[:role]
              @existing_user = User.where(email: @email).pluck(:email, :id).first
              unless @existing_user
                model.invite!(email: @email, role: role)
                @success = true
              end
              #@object.set_attributes(params[@abstract_model.param_key])
              @authorization_adapter && @authorization_adapter.attributes_for(:invite, @abstract_model).each do |name, value|
                @object.send("#{name}=", value)
              end







              #if @object.save
              #  @auditing_adapter && @auditing_adapter.create_object(@object, @abstract_model, _current_user)
              #  respond_to do |format|
              #    format.html { redirect_to_on_success }
              #    format.js   { render json: {id: @object.id.to_s, label: @model_config.with(object: @object).object_label} }
              #  end
              #else
              #  handle_save_error
              #end

            end
          end
        end
      end
    end
  end
end


