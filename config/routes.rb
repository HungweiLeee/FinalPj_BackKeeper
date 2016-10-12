Rails.application.routes.draw do

  mount ActionCable.server => "/cable"

  root 'pages#home'

	devise_for :users
	
  #root 'places#index'

  scope :path => '/api/v1/', :module => "api_v1", :defaults => { :format => :json }, :as => 'v1' do
 
    post "/login" => "auth#login"
    post "/logout" => "auth#logout"
    post "/new" => "auth#new"
    #post "/places" => "places#show"
 
    resources :places
    resources :reservations
    resources :pages
    
  end

  resources :users, only: [:show]
  resources :places

  resources :places do
    resources :reservations, only: [:create, :edit, :index, :show, :update]
  end

  resources :places do
    resources :reviews, only: [:create, :destroy]
  end

  resources :reservations

  resources :pages

  resources :conversations, only: [:index, :create] do
    resources :messages, only: [:index, :create]
  end

  get '/preload' => 'reservations#preload'


  resources :photos

  get '/your_trips' => 'reservations#your_trips'

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #root :to => "welcome#index"
  #root :to => "posts#index"
  
end
