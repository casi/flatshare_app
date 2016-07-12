Rails.application.routes.draw do
  root 'static_pages#home'
  get '/rules',		to: 'static_pages#rules'
end
