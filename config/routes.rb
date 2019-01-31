Rails.application.routes.draw do

  root 'demo#index'

  get 'admin_users/index'
  get 'admin_users/new'
  get 'admin_users/edit'
  get 'admin_users/delete'
  get 'admin', :to => 'access#menu'
  get 'access/menu'
  get 'access/login'
  post 'access/attempt_login'
  get 'access/logout'

  resources :admin_users do
    member do
      get :delete
    end
  end

  resources :subjects do
    member do
      get :delete
    end
  end

  resources :pages do
    member do
      get :delete
    end
  end

  resources :sections do
    member do
      get :delete
    end
  end

  get 'demo/index'
  get 'demo/hello'
  get 'demo/other_hello'
  get 'demo/lynda'
  get 'demo/escape_output'
  # match "demo/index", :to => "demo#index", :via => :get

  # default routing (will be deprecated in rails 5.2) DO NOT USE
  # get ':controller(/:action(/:id))'
end
