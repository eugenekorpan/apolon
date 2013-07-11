Apolon::Application.routes.draw do
	resources :books
  resources :users
  root :to => 'users#index'

  post 'auto_complete' => 'books#auto_complete', as: :auto_complete
end
