Rails.application.routes.draw do
  # resources :trips
  resources :parks
  # resources :users
  root to: "national_parks#index"
  resources :national_parks
  

  # get "/national_parks", to: "national_parks#index", as: "national_parks"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # GET national_parks/random
  # GET recipes/:id/information
end
