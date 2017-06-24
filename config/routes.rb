Rails.application.routes.draw do

  post '/signup',  to: 'users#create'

  get '/signup',  to: 'users#new'

  get '/help', to: 'pages#help'

  root 'pages#home'

  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
