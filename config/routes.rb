Rails.application.routes.draw do

  resources :infos
  root 'static_pages#home'
  get '/rules',		to: 'static_pages#rules'

  resources :users
end
