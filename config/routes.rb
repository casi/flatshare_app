Rails.application.routes.draw do

  root 'infos#index'
  get '/rules',         to: 'static_pages#rules'
  get 'infos/archived', to: 'infos#archived', as: 'archived_infos'

  resources :infos do
    resources :comments
  end

  resources :qandas
  resources :listitems do
    delete :index, on: :collection, action: :destroy_all
  end

  resources :users
end
