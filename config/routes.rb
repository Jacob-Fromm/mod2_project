Rails.application.routes.draw do
  # resources :trips
  # resources :parks
  # resources :users

  get "/parks", to: "parks#index", as: "parks"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
