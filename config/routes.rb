Rails.application.routes.draw do
  devise_for :users
  get 'items/index'
  root to: "items#index"
  resources :items, only: [:index, :new, :create, :show, :edit, :update]
  resources :items do
    resources :buy_logs, only: [:index, :create]
end
end