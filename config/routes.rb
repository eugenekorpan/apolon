Apolon::Application.routes.draw do
  resources :books do 
  	get :auto_complete, on: :collection
  end
	get 'books/autocomplete_user_name'

  resources :users
  root :to => 'users#index'
end
