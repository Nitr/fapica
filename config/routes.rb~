SpineRails3::Application.routes.draw do
  devise_for :users
  devise_for :users do
    get 'logout' => 'devise/sessions#destroy'
  end
 
  resources :pages
  
  root :to => 'pages#index'

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
  match 'api/get_hash/:hash' => 'api#get_hash', :via => :get
  match 'api/set_hash' => 'api#set_hash', :via => :post
  match 'api/get_user_role' => 'api#get_user_role'
  match 'api/users' => 'api#users'
  match 'api/user' => 'api#user_update', :via => :post
  match 'api/logs' => 'api#logs'
end
