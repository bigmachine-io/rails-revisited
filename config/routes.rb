Rails.application.routes.draw do
  resources :tracks
  resources :playlists
  resources :media_types
  resources :invoices
  resources :genres
  resources :artists
  resources :albums
  resources :customers
  
  devise_for :users,
    path: '',
    path_names: { sign_in: 'login', sign_out: 'logout' },
    controllers: { 
      sessions: "users/passwordless", 
      omniauth_callbacks: 'users/omniauth_callbacks'
    }
    
  resources :users

  #get '/about', to: 'home#about'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "home#index"
  mount Spina::Engine => '/'
end
