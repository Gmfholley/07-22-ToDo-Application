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
  
  # ➜  07-22-todo_application git:(master) ✗ rake routes
  #         Prefix Verb   URI Pattern                              Controller#Action
  #     user_tasks GET    /users/:user_id/tasks(.:format)          tasks#index
  #                POST   /users/:user_id/tasks(.:format)          tasks#create
  #  new_user_task GET    /users/:user_id/tasks/new(.:format)      tasks#new
  # edit_user_task GET    /users/:user_id/tasks/:id/edit(.:format) tasks#edit
  #      user_task GET    /users/:user_id/tasks/:id(.:format)      tasks#show
  #                PATCH  /users/:user_id/tasks/:id(.:format)      tasks#update
  #                PUT    /users/:user_id/tasks/:id(.:format)      tasks#update
  #                DELETE /users/:user_id/tasks/:id(.:format)      tasks#destroy
  #          users GET    /users(.:format)                         users#index
  #                POST   /users(.:format)                         users#create
  #       new_user GET    /users/new(.:format)                     users#new
  #      edit_user GET    /users/:id/edit(.:format)                users#edit
  #           user GET    /users/:id(.:format)                     users#show
  #                PATCH  /users/:id(.:format)                     users#update
  #                PUT    /users/:id(.:format)                     users#update
  #                DELETE /users/:id(.:format)                     users#destroy
  #           home GET    /                                        users#login
  #          login GET    /login(.:format)                         users#login
  #                POST   /login(.:format)                         users#login_check
  #   edit_profile GET    /profile/edit(.:format)                  users#edit
  #   profile_edit PUT    /profile/edit(.:format)                  users#update
  #        profile DELETE /profile(.:format)                       users#delete
  #                GET    /profile(.:format)                       users#show
  #    users_tasks GET    /users/:id/tasks(.:format)               tasks#users_tasks
  #       my_tasks GET    /tasks(.:format)                         tasks#index
  #    my_new_task GET    /tasks/new(.:format)                     tasks#new
  #      tasks_new POST   /tasks/new(.:format)                     tasks#create
  #   my_edit_task GET    /tasks/:id/edit(.:format)                tasks#edit
  #                PUT    /tasks/:id/edit(.:format)                tasks#update
  #                DELETE /tasks/:id(.:format)                     tasks#delete
  #        my_task GET    /tasks/:id(.:format)                     tasks#show
  
  
  resources :users do
    resources :tasks
  end
  
  get "/" => 'users#login', as: :home
  get "/login" => 'users#login', as: :login
  post "/login" => 'users#login_check'
  # get "/users" => 'users#index', as: :users
  # get "/users/new" => 'users#new', as: :new_user
  # post "/users/new" => 'users#create'
  get "/profile/edit" => 'users#edit', as: :edit_profile
  put "/profile" => 'users#update', as: :profile
  delete "/profile" => 'users#destroy'
  get "/profile" => 'users#show'
  # get "/users/:id" => 'users#show', as: :user    #identical to profile, except you're not logged in
  
  get "/tasks" => 'tasks#index', as: :my_tasks  #identical to users_tasks except you're logged in
  get "/tasks/new" => 'tasks#new', as: :new_my_task
  post "/tasks/new" => 'tasks#create'
  get "/tasks/:id/edit" => 'tasks#edit', as: :edit_my_task
  put "/tasks/:id/edit" => 'tasks#update'
  delete "/tasks/:id" => 'tasks#delete'
  get "/tasks/:id" => 'tasks#show', as: :my_task
    
end
