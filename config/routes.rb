Rails.application.routes.draw do
  resources :trips
  resources :parks
  resources :users
  get '/search', to: 'searches#new', as: 'search'
  post '/search', to: 'searches#show'

   get '/login', to: 'users#login', as: 'login'
   post '/login', to: 'users#handle_login'
   delete '/logout', to: 'users#logout'

   get '/', to: 'application#home', as: 'home'

end
