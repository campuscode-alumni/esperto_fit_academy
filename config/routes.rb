Rails.application.routes.draw do
  devise_for :trainers
  devise_for :employees
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"

  resources :gyms, only: %i[show new create]
  resources :employees, only: %i[new create show]
end
