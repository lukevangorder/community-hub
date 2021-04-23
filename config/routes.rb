Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/", to: "sessions#foyer"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/signup", to: "sessions#signup"
  post "/signup", to: "sessions#register"
  get "/home", to: "users#home"
  get "/logout", to: "sessions#logout"
  get '/auth/facebook/callback' => 'sessions#facebook' 
  get 'auth/failure', to: redirect('/')
  resources :users, only: [:show, :edit, :update] do
    resources :events, only: [:index]
  end
  resources :locations, only: [:edit, :update, :show] do
    resources :events, only: [:index]
  end
  resources :events, only: [:index, :show, :edit, :update]
  get '/event/new', to: "events#new"
  post '/events', to: "events#create"
  get '/locations', to: "locations#index"
  get '/locations/new', to: "locations#new"
  post '/locations', to: "locations#create"
  # get '/location/:id', to: "locations#show"
end
