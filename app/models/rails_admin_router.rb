class RailsAdminRouter
  def self.load(context)

    #routes_for_models(context, [Sigma::Manager], nil, "crm/managers")
    #routes_for_models(context, [Sigma::Administrator], nil, "crm/administrators")
    #routes_for_models(context, [Sigma::SuperAdministrator], nil, "crm/super_administrators")

    # always at the end of all custom routes
    routes_for_models(context, :all, [Sigma::Manager])
  end

  def self.routes_for_models(context, models = :all, skip_models = nil, controller_name = nil, actions = :all, prefix = nil)
    if skip_models.try(&:any?)
      skip_model_names = skip_models
    end

    model_names_restriction = nil

    restrictions_hash = {}

    if models != :all
      restrictions_hash[:model_name] = /#{models.map{|m| m.to_s.underscore.gsub("/", "~") }.join("|")}/
    end

    default_controller_name = "crm/main"
    default_controller_name = "rails_admin/main"
    if controller_name.nil?
      controller_name = default_controller_name
    else
      prefix = "#{controller_name.parameterize.underscore}_"
    end

    context.instance_eval do

      controller controller_name do
        RailsAdmin::Config::Actions.all(:root).each { |action| match "/#{action.route_fragment}", action: action.action_name, as: "#{prefix}#{action.action_name}", via: action.http_methods }
        scope ':model_name', restrictions_hash do
          RailsAdmin::Config::Actions.all(:collection).each { |action| match "/#{action.route_fragment}", action: action.action_name, as: "#{prefix}#{action.action_name}", via: action.http_methods }
          post '/bulk_action', action: :bulk_action, as: "#{prefix}bulk_action"
          scope ':id' do
            RailsAdmin::Config::Actions.all(:member).each do |action|
              match "/#{action.route_fragment}", action: action.action_name, as: "#{prefix}#{action.action_name}", via: action.http_methods
            end
          end
        end
      end
    end
  end
end