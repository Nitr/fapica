SpineRails3::Application.routes.draw do
  devise_for :users
  devise_for :users do
    get 'logout' => 'devise/sessions#destroy'
  end
 
  resources :pages
  
  root :to => 'pages#index'

  match 'api/get_user_role' => 'api#get_user_role'
  match 'api/users' => 'api#users'
  match 'api/logs' => 'api#logs'

  match 'api/get_hash/:hash' => 'api#get_hash', :via => :get
  match 'api/set_hash' => 'api#set_hash', :via => :post
  
  match 'api/user_activate/:id/:enter' => 'api#user_activate', :via => :get
end
