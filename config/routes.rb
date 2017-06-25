Rails.application.routes.draw do

  get    '/signin',   to: 'sessions#new'
  post   '/signin',   to: 'sessions#create'
  delete '/signout',  to: 'sessions#destroy'

  post '/signup',  to: 'users#create'
  get '/signup',  to: 'users#new'

  get '/help', to: 'pages#help'
  root 'pages#home'

  resources :notes
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
