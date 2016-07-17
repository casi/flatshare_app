Rails.application.routes.draw do

  resources :infos
  root 'infos#index'
  get '/rules',		to: 'static_pages#rules'

  resources :users
end
