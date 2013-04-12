Rideon::Application.routes.draw do
  resources :authentications

  devise_for :users, controllers: {registrations: "registrations"} #:skip => [:sessions] do
  #   get '/users' => 'devise/sessions#new', :as => :new_user_session
  #   post '/users' => 'devise/sessions#create', :as => :user_session
  #   get '/users' => 'devise/sessions#destroy', :as => :destroy_user_session
  # end

  # devise_for :providers, controllers: {registrations: "providers/registrations"}, :skip => [:sessions] do
  #   get '/providers' => 'devise/sessions#new', :as => :new_provider_session
  #   post '/providers' => 'devise/sessions#create', :as => :provider_session
  #   get '/providers' => 'devise/sessions#destroy', :as => :destroy_provider_session
  # end
  resources :providers
  resources :members
  resources :routes
  match "auth/twitter/callback" => "authentications#twitter"
  match "auth/facebook/callback" => "authentications#facebook"

  resources :ratings

  root to: 'authentications#home'
  #root :to => 'Users#index'
  resources :users, :path => 'user'

  #Set custom routes for devise (registrations, authentications)
  devise_scope :user do
    #get "/", :to => "registrations#new"
    get "/login" => "devise/sessions#new"
    get "/logout" => "devise/sessions#destroy"
    get "/register" => "members#new"
  end

  #match '/auth/:provider/callback' => 'authentications#create'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
