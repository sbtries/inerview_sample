Rails.application.routes.draw do
  devise_for :accounts
  resources :groups
    
  # get 'home/index'
  get 'home/admin'
  post 'home/import'
  root 'home#index'
end
