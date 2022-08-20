Rails.application.routes.draw do
  root 'dashboard#index'
  resources :products do
    member do
      get :new_movement
    end
  end
end
