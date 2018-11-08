Rails.application.routes.draw do
  root 'home#index'
  post '/show', to: 'home#show', as: 'show'
  get '/show', to: 'home#index'
  patch '/show', to: 'home#show'
  get '/update', to: 'home#update', as: 'update'
end
