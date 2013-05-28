Apolon::Application.routes.draw do
  resources :books


  resources :users
  root :to => 'users#index'
end
