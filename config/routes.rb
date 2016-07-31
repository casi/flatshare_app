Rails.application.routes.draw do

  root 'infos#index'
  get '/rules',   to: 'static_pages#rules'
  get 'infos/archived', to:'infos#archived', as: 'archived_infos'
  resources :users

  resources :infos do
    resources :comments
  end

end
