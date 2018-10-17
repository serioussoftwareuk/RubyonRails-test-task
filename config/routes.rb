Rails.application.routes.draw do
  root to: 'locations#index'
  resources :locations, only: %w(show create)
end
