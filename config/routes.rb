Rails.application.routes.draw do
  devise_for :users

  root to: 'charities#index'

  resources :users, only: [:show]

  resources :charities do
    resources :donations, only: [:create]
    resources :plans do
      resources :subscribers, only: [:create, :destroy]
    end

  end
end
