Rails.application.routes.draw do
  root to: 'charities#index'
  resources :charities do
    resources :donations, only: [:create]
    resources :plans
  end
end
