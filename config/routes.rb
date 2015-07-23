Rails.application.routes.draw do
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
  
  resources :users do
    resources :tasks
  end
  
  get "/" => 'users#login', as: :home
  get "/login" => 'users#login', as: :login
  post "/login" => 'users#login_check'
  # get "/users" => 'users#index', as: :users
  # get "/users/new" => 'users#new', as: :new_user
  # post "/users/new" => 'users#create'
  get "profile/edit" => 'users#edit', as: :edit_profile
  put "profile/edit" => 'users#update'
  delete "profile" => 'users#delete', as: :profile
  get "/profile" => 'users#profile'
  # get "/users/:id" => 'users#show', as: :user    #identical to profile, except you're not logged in
  
  get "/users/:id/tasks" => 'tasks#users_tasks', as: :users_tasks
  get "/tasks" => 'tasks#index', as: :my_tasks  #identical to users_tasks except you're logged in
  get "/tasks/new" => 'tasks#new', as: :my_new_task
  post "/tasks/new" => 'tasks#create'
  get "/tasks/:id/edit" => 'tasks#edit', as: :my_edit_task
  put "/tasks/:id/edit" => 'tasks#update'
  delete "/tasks/:id" => 'tasks#delete'
  get "/tasks/:id" => 'tasks#show', as: :my_task
  
  
end
