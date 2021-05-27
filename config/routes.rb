Rails.application.routes.draw do
  devise_for :users
  # get 'comments/index'
  root to: "rooms#index"
  resources :contacts, only: [:new, :create, :edit, :update]
  resources :rooms, only: [:new, :create, :destroy] do
    resources :comments, only: [:index, :create]
    resources :memos, only: :create do
      collection do
        post 'update'
        patch 'update'
      end
    end
  end
end
