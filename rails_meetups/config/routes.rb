Rails.application.routes.draw do
  devise_for :accounts
  resources :groups
  # get 'home/index'
  get 'home/admin'
  root 'home#index'
end
