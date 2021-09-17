Rails.application.routes.draw do
  resources :groups
  # get 'home/index'
  get 'home/about'
  root 'home#index'
end
