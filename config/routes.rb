Rails.application.routes.draw do

  get 'pages/index'

  get 'pages/show'

  get 'pages/new'

  get 'pages/edit'

  get 'pages/delete'

  root 'demo#index'

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

  get 'demo/index'
  get 'demo/hello'
  get 'demo/other_hello'
  get 'demo/lynda'
  # match "demo/index", :to => "demo#index", :via => :get

  # default routing (will be deprecated in rails 5.2) DO NOT USE
  # get ':controller(/:action(/:id))'
end
