Apolon::Application.routes.draw do
  resources :books
  resources :users
  root :to => 'users#index'

  resources :books do
	  get :autocomplete_user_first_name, on: :collection
	end
end
