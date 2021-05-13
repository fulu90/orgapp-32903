Rails.application.routes.draw do
  devise_for :users
  # get 'comments/index'
  root to: "rooms#index"
  resources :rooms, only: [:new, :create, :destroy] do
    resources :comments, only: [:index, :create]
  end
end
