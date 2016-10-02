Rails.application.routes.draw do

  root 'pages#home'

	devise_for :users
	
  root 'places#index'

  resources :users, only: [:show]
  resources :places
  resources :photos

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #root :to => "welcome#index"
  #root :to => "posts#index"
  
end
