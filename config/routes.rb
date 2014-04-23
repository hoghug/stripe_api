Rails.application.routes.draw do
  root to: 'charities#index'
  resources :charities
end
