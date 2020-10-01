Rails.application.routes.draw do
  resources :trips
  resources :parks
  resources :users
  get '/search', to: 'searches#new'
  post '/search', to: 'searches#show'

  get '/cookie', to: 'trips#cookie', as: 'cookie'
  post '/cookie', to: 'trips#create'
   


   get '/login', to: 'users#login', as: 'login'
   post '/login', to: 'users#handle_login'
   delete '/logout', to: 'users#logout'

   get '/', to: 'application#home', as: 'home'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # get '/login', to: 'users#login', as: 'login'
  # post '/login', to: 'users#handle_login'
  # delete '/logout', to: 'users#logout'

  # get '/', to: 'application#home', as: 'home'
end
