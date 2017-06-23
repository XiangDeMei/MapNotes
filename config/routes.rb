Rails.application.routes.draw do

  get '/signup',  to: 'users#new'

  get '/help', to: 'pages#help'

  root 'pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
