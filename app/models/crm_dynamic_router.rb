class CrmDynamicRouter
  def self.load
    Rails.application.class.routes.draw do
      scope ":resource_class", controller: "dynamic_resources" do
        get "", action: "index"
        get ":resource_id", action: "show"
        get "new", action: "new"
        get ":resource_id/edit", action: "edit"
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