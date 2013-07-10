Apolon::Application.routes.draw do
  resources :books
	get 'books/autocomplete_user_name'

  resources :users
  root :to => 'users#index'
end
