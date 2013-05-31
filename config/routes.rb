Apolon::Application.routes.draw do
  resources :books do
    get :auto_complete, on: :collection
  end

  resources :users
  root :to => 'users#index'
end
