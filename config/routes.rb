Rails.application.routes.draw do
  resources :comments
  resources :photos
  resources :memories
  resources :users
  post '/login', to: 'users#login'
  get '/get_user', to: 'users#get_user'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
