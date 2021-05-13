Rails.application.routes.draw do
  devise_for :users
  # get 'comments/index'
  root to: "rooms#index"
  resources :rooms, only: [:new, :create]
end
