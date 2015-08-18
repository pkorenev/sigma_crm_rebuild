class CrmDynamicRouter
  def self.load
    Rails.application.class.routes.draw do
      crm_route_prefix = "crm_admin_"

      scope ":resource_class", controller: "simple_crms" do
        get "", action: "index", as: "#{crm_route_prefix}resources"
        get ":resource_id", action: "show", as: "#{crm_route_prefix}resource"
        get "new", action: "new", as: "#{crm_route_prefix}new_resource"
        get ":resource_id/edit", action: "edit", as: "#{crm_route_prefix}edit_resource"
        post "", action: "create"
        match ":resource_id", action: "update", via: [:put, :patch]
        delete ":resource_id", action: "destroy"
      end
    end
  end

  def self.reload
    Rails.application.class.routes_reloader.reload!
  end
end