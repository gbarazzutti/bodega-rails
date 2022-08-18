Rails.application.routes.draw do
  root 'dashboard#index'
  resources :products
end
