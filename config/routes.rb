Rails.application.routes.draw do

  get 'sessions/new'

  root 'sessions#new'
  get '/rules',         to: 'static_pages#rules'
  get '/housework',     to: 'static_pages#housework'
  get 'infos/archived', to: 'infos#archived', as: 'archived_infos'

  get    '/login',      to: 'sessions#new'
  post   '/login',      to: 'sessions#create'
  delete '/logout',     to: 'sessions#destroy'

  resources :infos do
    resources :comments
  end

  resources :qandas
  resources :listitems do
    delete :index, on: :collection, action: :destroy_all
  end

  resources :users
end
