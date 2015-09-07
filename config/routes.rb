#require Gem.loaded_specs['fredit'].stub.gem_dir + "/app/controllers/fredit_controller.rb"
unless !!ENV['si']
  Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
    devise_for :users, class_name: "Sigma::User"
    #get "(*args)", to: "application#test_page"
    #get "test", to: "application#test"

    #devise_for :users
    constraints subdomain: "crm" do
      mount RailsAdmin::Engine => '', as: 'rails_admin'
    end

    namespace "crm", module: "crm", path: "/" do
      root to: "dashboard#index"
      resources :complexes
      resources :apartment_houses
      resources :apartments
    end

    #mount Cms::Engine, at: ""

    #mount Crm::Engine, at: "/"

    #resources :apartments, controller: "crm_admin/apartments"



    #get "routes/reload"
    #get "log", to: "log#index"

    #mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
    concern :commentable do
      resources :comments
    end

    concern :assetable do
      resources :assets
    end

    #root to: "crm_admin#dashboard"

    #devise_for :accounts
    #mount "fredit", "edit"
    # scope "edit", controller: "front_edit" do
    #   get 'revision', action: "revision"
    #   get '', action: "show", as: "fredit"
    #   put '', action: "update"
    #   post '', action: "create"
    #   post 'upload', action: "upload"
    # end

    #CrmDynamicRouter.load

    # The priority is based upon order of creation: first created -> highest priority.
    # See how all your routes lay out with "rake routes".

    # You can have the root of your site routed with "root"
    # root 'welcome#index'

    # Example of regular route:
    #   get 'products/:id' => 'catalog#view'

    # Example of named route that can be invoked with purchase_url(id: product.id)
    #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

    # Example resource route (maps HTTP verbs to controller actions automatically):
    #   resources :products

    # Example resource route with options:
    #   resources :products do
    #     member do
    #       get 'short'
    #       post 'toggle'
    #     end
    #
    #     collection do
    #       get 'sold'
    #     end
    #   end

    # Example resource route with sub-resources:
    #   resources :products do
    #     resources :comments, :sales
    #     resource :seller
    #   end

    # Example resource route with more complex sub-resources:
    #   resources :products do
    #     resources :comments
    #     resources :sales do
    #       get 'recent', on: :collection
    #     end
    #   end

    # Example resource route with concerns:
    #   concern :toggleable do
    #     post 'toggle'
    #   end
    #   resources :posts, concerns: :toggleable
    #   resources :photos, concerns: :toggleable

    # Example resource route within a namespace:
    #   namespace :admin do
    #     # Directs /admin/products/* to Admin::ProductsController
    #     # (app/controllers/admin/products_controller.rb)
    #     resources :products
    #   end
  end
end